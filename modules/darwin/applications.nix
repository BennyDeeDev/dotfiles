{
  homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      appcleaner
      caffeine
      the-unarchiver
    ];
  };
}
