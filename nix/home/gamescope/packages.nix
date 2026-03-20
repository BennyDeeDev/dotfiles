{ pkgs, dotfiles, config, ... }:

{
  home.packages = with pkgs; [
    mangohud
    lsfg-vk
    liberation_ttf
    wqy_zenhei
  ];

  home.file.".config/lsfg-vk/conf.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/gamescope/lsfg-vk.toml";

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly";
  };
}
