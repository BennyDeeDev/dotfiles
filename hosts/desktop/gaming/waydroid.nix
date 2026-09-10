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
          ${lib.getExe pkgs.waydroid-nftables} prop set persist.waydroid.uevent true >/dev/null

          shopt -s nullglob

          for link in \
            /dev/input/by-id/*-event-joystick \
            /dev/input/by-path/*-event-joystick
          do
            node="$(readlink -f "$link")"
            [[ $node == /dev/input/event[0-9]* ]] || continue
            printf 'add\n' > "/sys/class/input/''${node##*/}/uevent"
          done
        '';
      };
    in
    {
      virtualisation.waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
      };
      systemd.services.${controllerHelperName} = {
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
          pkgs.systemd
        ];
        text = ''
          ${waydroid} session start &
          until ${waydroid} app list 2>/dev/null | grep -Fqx "packageName: $1"; do
            sleep 1
          done
          ${lib.getExe' pkgs.systemd "systemctl"} start ${controllerHelperName}.service
          ${waydroid} app launch "$1"
          wait
        '';
      };

      waydroidSteamLauncher = pkgs.writeShellApplication {
        name = "waydroid-steam-launcher";
        text = ''
          exec ${lib.getExe pkgs.cage} -- ${lib.getExe waydroidSteamSession} "$1"
        '';
      };
    in
    {
      home.packages = [ waydroidSteamLauncher ];
    };
}
