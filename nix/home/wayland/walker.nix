{ pkgs, ... }:

{
  home.packages = [ pkgs.walker ];

  xdg.configFile."autostart/walker.desktop".text = ''
    [Desktop Entry]
    Name=Walker
    Comment=Walker Service
    Exec=${pkgs.walker}/bin/walker --gapplication-service
    StartupNotify=false
    Terminal=false
    Type=Application
  '';
}
