{
  homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      wl-clipboard
      grim
      slurp
      swappy
      xwayland-satellite
      adw-gtk3
    ];
  };
}
