{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mangohud
    liberation_ttf
    wqy_zenhei
  ];

  xdg.desktopEntries.steam = {
    name = "Steam";
    exec = "env GDK_SCALE=2 steam";
    icon = "steam";
    terminal = false;
    type = "Application";
    categories = [ "Network" "FileTransfer" "Game" ];
    mimeType = [ "x-scheme-handler/steam" "x-scheme-handler/steamlink" ];
    settings = {
      PrefersNonDefaultGPU = "true";
      X-KDE-RunOnDiscreteGpu = "true";
    };
  };

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly";
  };
}
