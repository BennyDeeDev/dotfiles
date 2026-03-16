{ pkgs, ... }:

{
  systemd.user.services.elephant = {
    Unit = {
      Description = "Elephant";
      After = [ "graphical-session.target" ];
    };
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.elephant}/bin/elephant";
      Restart = "on-failure";
    };
  };

  xdg.configFile."autostart/walker.desktop".text = ''
    [Desktop Entry]
    Name=Walker
    Comment=Walker Service
    Exec=${pkgs.walker}/bin/walker --gapplication-service
    StartupNotify=false
    Terminal=false
    Type=Application
  '';

  home.packages = with pkgs; [
    wl-clipboard
    mako
    swayosd
    swaybg
    grim
    slurp
    satty
    hyprpicker
    hyprsunset
    hypridle
    hyprlock
    xwayland-satellite
    uwsm
    networkmanagerapplet
    walker
    elephant
  ];
}
