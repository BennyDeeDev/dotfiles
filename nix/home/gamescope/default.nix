{ pkgs, lib, config, dotfiles, ... }:

{
  home.packages = with pkgs; [
    mangohud
    lsfg-vk
    steam-rom-manager
    ludusavi
    rclone
    liberation_ttf
    wqy_zenhei
  ];

  services.flatpak.packages = [
    "io.github.ryubing.Ryujinx"
    "com.usebottles.bottles"
  ];

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly";
  };

  services.flatpak.overrides = {
    "io.github.ryubing.Ryujinx".Context = {
      filesystems = [ "~/Games/Switch:rw" "xdg-config/Ryujinx:rw" ];
      shared = [ "!network" ];
    };
    "com.usebottles.bottles".Context = {
      filesystems = [ "~/Games/PC:rw" "~/Repos/dotfiles/bottles:rw" "/mnt/bazzite/home/bazzite/Games/PC:ro" ];
    };
  };

  home.file = {
    ".var/app/com.usebottles.bottles/data/bottles/bottles/Games-Exe-Runner-Proton/bottle.yml".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/bottles/bottle.yml";
    ".config/lsfg-vk/conf.toml".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gamescope/lsfg-vk.toml";
    ".config/steam-rom-manager/userData/userConfigurations.json".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/steam-rom-manager/userConfigurations.json";
    ".config/steam-rom-manager/userData/userSettings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/steam-rom-manager/userSettings.json";
    ".config/ludusavi/config.yaml".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/ludusavi/config.yaml";
  };

  home.activation.steamRomManagerBootstrap = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    sentinel="$HOME/.local/share/steam-rom-manager/bootstrapped"
    if [[ ! -f $sentinel ]]; then
      pkill steam || true
      ${pkgs.steam-rom-manager}/bin/steam-rom-manager add
      mkdir -p "$(dirname $sentinel)"
      touch "$sentinel"
    fi
  '';

  # TODO: Should use SOPS at some point
  home.activation.rcloneConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [[ ! -f $HOME/.config/rclone/rclone.conf ]]; then
      password=$(grep -oP 'password=\K.*' /etc/nixos/smb-secrets)
      obscured=$(${pkgs.rclone}/bin/rclone obscure "$password")
      mkdir -p "$HOME/.config/rclone"
      sed "s/^pass =$/pass = $obscured/" \
        "${dotfiles}/rclone/rclone.conf" \
        > "$HOME/.config/rclone/rclone.conf"
    fi
  '';

  home.activation.ludusaviBootstrap = lib.hm.dag.entryAfter [ "rcloneConfig" ] ''
    mkdir -p "$HOME/Backups/ludusavi
    if [[ -z $(ls -A $HOME/Backups/ludusavi 2>/dev/null) ]]; then
      ${pkgs.rclone}/bin/rclone sync \
        --fast-list --ignore-checksum \
        "ludusavi-1759601223:/Ludusavi/ludusavi-backup" \
        "$HOME/Backups/ludusavi" && \
      ${pkgs.ludusavi}/bin/ludusavi restore --force && \
      ${pkgs.ludusavi}/bin/ludusavi backup --force || true
    fi
  '';

  systemd.user.services.ludusavi-backup = {
    Unit.Description = "Ludusavi backup (NAS sync via Cloud settings)";
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.ludusavi}/bin/ludusavi backup --force";
      ExecStartPost = "${pkgs.ludusavi}/bin/ludusavi cloud upload --force";
    };
  };

  systemd.user.timers.ludusavi-backup = {
    Unit.Description = "Run Ludusavi backup on a timer";
    Timer = {
      OnCalendar = "*:0/15";
      Persistent = true;
      RandomizedDelaySec = "2m";
    };
    Install.WantedBy = [ "timers.target" ];
  };

}
