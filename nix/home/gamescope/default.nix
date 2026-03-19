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
      filesystems = [ "~/Games/PC:rw" "xdg-data/applications:rw" ];
      shared = [ "!network" ];
    };
  };

  home.activation.lsfgVkConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.config/lsfg-vk"
    ln -sf "$HOME/Repos/dotfiles/gamescope/lsfg-vk.toml" "$HOME/.config/lsfg-vk/conf.toml"
  '';

  home.activation.ludusaviConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.config/ludusavi"
    ln -sf "$HOME/Repos/dotfiles/ludusavi/config.yaml" "$HOME/.config/ludusavi/config.yaml"
    mkdir -p "$HOME/Backups/ludusavi"
  '';
}
