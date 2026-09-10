let
  controllerHelperName = "waydroid-controller-coldplug";
in
{
  nixos =
    { lib, pkgs, ... }:
    let
      controllerHelper = pkgs.writeShellApplication {
        name = controllerHelperName;
        runtimeInputs = [ pkgs.coreutils ];
        text = ''
          if [[ $# -ne 0 ]]; then
            echo "${controllerHelperName} does not accept arguments" >&2
            exit 2
          fi

          ${lib.getExe pkgs.waydroid-nftables} prop set persist.waydroid.uevent true >/dev/null

          shopt -s nullglob

          trigger_node() {
            local node="$1"
            local name="''${node##*/}"
            local uevent="/sys/class/input/$name/uevent"

            if [[ -w $uevent ]]; then
              printf 'add\n' > "$uevent"
            fi
          }

          for link in \
            /dev/input/by-id/*-event-joystick \
            /dev/input/by-path/*-event-joystick
          do
            [[ -e $link ]] || continue
            node="$(readlink -f "$link")"
            [[ $node == /dev/input/event[0-9]* ]] || continue
            trigger_node "$node"
          done
        '';
      };
    in
    {
      virtualisation.waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
      };
      environment.systemPackages = [
        pkgs.cage
        controllerHelper
      ];

      systemd.services.waydroid-controller-coldplug = {
        description = "Replay controller uevents for Waydroid";
        serviceConfig = {
          Type = "oneshot";
          ExecStart = lib.getExe controllerHelper;
        };
      };

      security.polkit.extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (action.id == "org.freedesktop.systemd1.manage-units" &&
              action.lookup("unit") == "waydroid-controller-coldplug.service" &&
              action.lookup("verb") == "start" &&
              subject.user == "benjamin" &&
              subject.local &&
              subject.active) {
            return polkit.Result.YES;
          }
        });
      '';
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
          pkgs.procps
          pkgs.systemd
        ];
        text = ''
          package="$1"
          case "$package" in
            com.stremio.one|com.nuvio.tv|org.smarttube.stable)
              ;;
            *)
              echo "Unsupported Waydroid package: $package" >&2
              exit 2
              ;;
          esac

          session_pid=
          stop_session() {
            ${waydroid} session stop >/dev/null 2>&1 || true
            for _ in {1..40}; do
              status="$(${waydroid} status 2>/dev/null || true)"
              if grep -q '^Session:[[:space:]]*STOPPED' <<< "$status"; then
                sleep 1
                return 0
              fi
              sleep 0.25
            done
            return 1
          }

          wait_for_session_process() {
            if [[ -z $session_pid ]]; then
              return 0
            fi
            for _ in {1..40}; do
              if ! kill -0 "$session_pid" 2>/dev/null; then
                wait "$session_pid" 2>/dev/null || true
                session_pid=
                return 0
              fi
              sleep 0.25
            done
            kill "$session_pid" 2>/dev/null || true
            wait "$session_pid" 2>/dev/null || true
            session_pid=
          }

          cleanup_session() {
            exit_status=$?
            trap - EXIT INT TERM HUP
            stop_session || true
            wait_for_session_process
            exit "$exit_status"
          }
          trap cleanup_session EXIT
          trap 'exit 130' INT
          trap 'exit 143' TERM HUP

          status="$(${waydroid} status 2>/dev/null || true)"
          if grep -q '^Session:[[:space:]]*RUNNING' <<< "$status"; then
            echo "Stopping the existing Waydroid session"
            if ! stop_session; then
              echo "Waydroid session did not stop" >&2
              exit 1
            fi
          fi

          package_ready=false
          for attempt in {1..3}; do
            echo "Starting Waydroid session (attempt $attempt/3)"
            ${waydroid} session start &
            session_pid=$!

            deadline=$((SECONDS + 60))
            while (( SECONDS < deadline )); do
              if ! kill -0 "$session_pid" 2>/dev/null; then
                wait "$session_pid" 2>/dev/null || true
                session_pid=
                break
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

            if [[ $package_ready == true ]]; then
              break
            fi

            if [[ $attempt -lt 3 ]]; then
              echo "Waydroid session was not ready; retrying" >&2
              stop_session || true
              wait_for_session_process
            fi
          done

          if [[ $package_ready != true ]]; then
            echo "Waydroid package was not ready within 60 seconds: $package" >&2
            exit 1
          fi

          if ! ${lib.getExe' pkgs.systemd "systemctl"} start waydroid-controller-coldplug.service; then
            echo "Waydroid controller coldplug failed" >&2
            exit 1
          fi

          # Android can report ready just before SystemUI finishes initializing.
          sleep 1
          echo "Launching Waydroid package: $package"
          ${waydroid} app launch "$package"

          process_name="''${package:0:15}"
          app_pid=
          deadline=$((SECONDS + 30))
          while [[ -n $session_pid ]] && kill -0 "$session_pid" 2>/dev/null; do
            app_pid="$(pgrep -x "$process_name" | head -n 1 || true)"
            if [[ -n $app_pid ]] || (( SECONDS >= deadline )); then
              break
            fi
            sleep 1
          done

          if [[ -z $app_pid ]]; then
            echo "Waydroid package did not stay running: $package" >&2
            stop_session || true
            wait_for_session_process
            exit 1
          fi
          echo "Monitoring Waydroid package PID $app_pid: $package"

          app_is_alive() {
            [[ -d /proc/$app_pid ]] || return 1
            app_state="$(ps -o state= -p "$app_pid" 2>/dev/null || true)"
            [[ -n $app_state && $app_state != Z* ]]
          }

          while [[ -n $session_pid ]] && kill -0 "$session_pid" 2>/dev/null && app_is_alive; do
            sleep 1
          done

          echo "Waydroid package PID exited: $app_pid ($package)"
          stop_session || true
          wait_for_session_process
        '';
      };

      waydroidSteamLauncher = pkgs.writeShellApplication {
        name = "waydroid-steam-launcher";
        runtimeInputs = [
          pkgs.coreutils
          pkgs.util-linux
        ];
        text = ''
          package="''${1:-}"
          if [[ $# -ne 1 || -z $package ]]; then
            echo "Usage: waydroid-steam-launcher <package>" >&2
            exit 2
          fi

          exec 9>"$XDG_RUNTIME_DIR/waydroid-steam-launcher.lock"
          if ! flock -n 9; then
            echo "Stopping the existing Waydroid Steam launcher"
            ${waydroid} session stop >/dev/null 2>&1 || true
            if ! flock -w 15 9; then
              echo "Another Waydroid Steam launcher is still running" >&2
              exit 1
            fi
          fi

          cage_pid=
          cleanup() {
            exit_status=$?
            trap - EXIT INT TERM HUP
            ${waydroid} session stop >/dev/null 2>&1 || true
            if [[ -n $cage_pid ]]; then
              kill "$cage_pid" 2>/dev/null || true
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
