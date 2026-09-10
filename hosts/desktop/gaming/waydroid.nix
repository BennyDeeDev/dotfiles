{
  nixos =
    { pkgs, ... }:
    {
      virtualisation.waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
      };
      environment.systemPackages = [ pkgs.cage ];
    };

  homeManager =
    {
      lib,
      pkgs,
      ...
    }:
    let
      waydroid = lib.getExe pkgs.waydroid-nftables;

      waydroidSteamSession = pkgs.writeShellApplication {
        name = "waydroid-steam-session";
        runtimeInputs = [
          pkgs.coreutils
          pkgs.gnugrep
        ];
        text = ''
          package="$1"

          session_pid=
          cleanup_session() {
            exit_status=$?
            trap - EXIT INT TERM HUP
            ${waydroid} session stop >/dev/null 2>&1 || true
            if [[ -n $session_pid ]]; then
              wait "$session_pid" 2>/dev/null || true
            fi
            exit "$exit_status"
          }
          trap cleanup_session EXIT
          trap 'exit 130' INT
          trap 'exit 143' TERM HUP

          status="$(${waydroid} status 2>/dev/null || true)"
          if grep -q '^Session:[[:space:]]*RUNNING' <<< "$status"; then
            echo "Stopping the existing Waydroid session"
            ${waydroid} session stop

            session_stopped=false
            for _ in {1..40}; do
              status="$(${waydroid} status 2>/dev/null || true)"
              if grep -q '^Session:[[:space:]]*STOPPED' <<< "$status"; then
                session_stopped=true
                break
              fi
              sleep 0.25
            done

            if [[ $session_stopped != true ]]; then
              echo "Waydroid session did not stop" >&2
              exit 1
            fi
          fi

          echo "Starting Waydroid session"
          ${waydroid} session start &
          session_pid=$!

          package_ready=false
          deadline=$((SECONDS + 60))
          while (( SECONDS < deadline )); do
            if ! kill -0 "$session_pid" 2>/dev/null; then
              echo "Waydroid session exited during startup" >&2
              exit 1
            fi

            status="$(${waydroid} status 2>/dev/null || true)"
            if grep -q '^Session:[[:space:]]*RUNNING' <<< "$status"; then
              apps="$(timeout 2s ${waydroid} app list 2>/dev/null || true)"
              if grep '^packageName:' <<< "$apps" \
                | tr -d '\r' \
                | grep -Fxq "packageName: $package"; then
                package_ready=true
                break
              fi
            fi
            sleep 1
          done

          if [[ $package_ready != true ]]; then
            echo "Waydroid package was not ready within 60 seconds: $package" >&2
            exit 1
          fi

          # Android can report ready just before SystemUI finishes initializing.
          sleep 1
          echo "Launching Waydroid package: $package"
          ${waydroid} app launch "$package"

          wait "$session_pid"
        '';
      };

      waydroidSteamLauncher = pkgs.writeShellApplication {
        name = "waydroid-steam-launcher";
        text = ''
          package="''${1:-}"
          if [[ $# -ne 1 || -z $package ]]; then
            echo "Usage: waydroid-steam-launcher <package>" >&2
            exit 2
          fi

          cage_pid=
          cleanup() {
            exit_status=$?
            trap - EXIT INT TERM HUP
            ${waydroid} session stop >/dev/null 2>&1 || true
            if [[ -n $cage_pid ]]; then
              wait "$cage_pid" 2>/dev/null || true
            fi
            exit "$exit_status"
          }
          trap cleanup EXIT
          trap 'exit 130' INT
          trap 'exit 143' TERM HUP

          ${lib.getExe pkgs.cage} -- ${lib.getExe waydroidSteamSession} "$package" &
          cage_pid=$!
          wait "$cage_pid"
        '';
      };
    in
    {
      home.packages = [ waydroidSteamLauncher ];

      xdg.desktopEntries.waydroid-cage = {
        name = "Waydroid Android TV";
        comment = "Run Waydroid inside Cage";
        exec = "${lib.getExe pkgs.cage} -- ${lib.getExe pkgs.waydroid-nftables} show-full-ui";
        terminal = false;
        categories = [
          "AudioVideo"
          "Player"
        ];
      };
    };
}
