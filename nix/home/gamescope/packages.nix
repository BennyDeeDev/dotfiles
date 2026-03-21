{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mangohud
    liberation_ttf
    wqy_zenhei
  ];

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly";
  };
}
