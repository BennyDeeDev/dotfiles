{ pkgs, ... }:

{
  systemd.user.services.elephant = {
    Unit.Description = "Elephant app index daemon";
    Unit.PartOf = [ "graphical-session.target" ];
    Unit.After = [ "graphical-session.target" ];
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      ExecStart = "${pkgs.elephant}/bin/elephant";
      Restart = "on-failure";
    };
  };

  systemd.user.services.walker = {
    Unit.Description = "Walker app launcher service";
    Unit.PartOf = [ "graphical-session.target" ];
    Unit.After = [ "graphical-session.target" "elephant.service" ];
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      ExecStart = "${pkgs.walker}/bin/walker --gapplication-service";
      Restart = "on-failure";
    };
  };

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
