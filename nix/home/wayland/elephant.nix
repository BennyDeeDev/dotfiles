{ pkgs, ... }:

{
  home.packages = [ pkgs.elephant ];

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
}
