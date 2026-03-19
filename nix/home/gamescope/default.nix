{ pkgs, lib, ... }:

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

  services.flatpak.overrides = {
    "io.github.ryubing.Ryujinx".Context = {
      filesystems = [ "~/Games/Switch:rw" "xdg-config/Ryujinx:rw" ];
      shared = [ "!network" ];
    };
    "com.usebottles.bottles".Context = {
      filesystems = [ "~/Games/PC:rw" "~/Repos/dotfiles/bottles:rw" "/mnt/bazzite/home/bazzite/Games/PC:ro" ];
    };
  };

  home.activation.bottlesSetup = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    bottle_dir="$HOME/.var/app/com.usebottles.bottles/data/bottles/bottles/Games-Exe-Runner-Proton"
    mkdir -p "$bottle_dir"
    ln -sf "$HOME/Repos/dotfiles/bottles/bottle.yml" "$bottle_dir/bottle.yml"
  '';

  home.activation.lsfgVkConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.config/lsfg-vk"
    ln -sf "$HOME/Repos/dotfiles/gamescope/lsfg-vk.toml" "$HOME/.config/lsfg-vk/conf.toml"
  '';

  home.activation.steamRomManagerConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.config/steam-rom-manager/userData"
    ln -sf "$HOME/Repos/dotfiles/steam-rom-manager/userConfigurations.json" "$HOME/.config/steam-rom-manager/userData/userConfigurations.json"
    ln -sf "$HOME/Repos/dotfiles/steam-rom-manager/userSettings.json" "$HOME/.config/steam-rom-manager/userData/userSettings.json"
  '';

  home.activation.steamRomManagerBootstrap = lib.hm.dag.entryAfter [ "steamRomManagerConfig" ] ''
    sentinel="$HOME/.local/share/steam-rom-manager/bootstrapped"
    if [[ ! -f $sentinel ]]; then
      pkill steam || true
      ${pkgs.steam-rom-manager}/bin/steam-rom-manager add
      mkdir -p "$(dirname $sentinel)"
      touch "$sentinel"
    fi
  '';

  home.activation.rcloneConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [[ ! -f $HOME/.config/rclone/rclone.conf ]]; then
      password=$(grep -oP 'password=\K.*' /etc/nixos/smb-secrets)
      obscured=$(${pkgs.rclone}/bin/rclone obscure "$password")
      mkdir -p "$HOME/.config/rclone"
      sed "s/^pass =$/pass = $obscured/" \
        "$HOME/Repos/dotfiles/rclone/rclone.conf" \
        > "$HOME/.config/rclone/rclone.conf"
    fi
  '';

  home.activation.ludusaviConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.config/ludusavi"
    ln -sf "$HOME/Repos/dotfiles/ludusavi/config.yaml" "$HOME/.config/ludusavi/config.yaml"
    mkdir -p "$HOME/Backups/ludusavi"
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

  home.activation.ludusaviPullBackup = lib.hm.dag.entryAfter [ "ludusaviConfig" "rcloneConfig" ] ''
    if [[ -z $(ls -A $HOME/Backups/ludusavi 2>/dev/null) ]]; then
      ${pkgs.rclone}/bin/rclone sync \
        --fast-list --ignore-checksum \
        "ludusavi-1759601223:/Ludusavi/ludusavi-backup" \
        "$HOME/Backups/ludusavi" && \
      ${pkgs.ludusavi}/bin/ludusavi restore --force && \
      ${pkgs.ludusavi}/bin/ludusavi backup --force || true
    fi
  '';
}
