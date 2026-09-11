{
  homeManager =
    { pkgs, ... }:
    {
      programs = {
        brave.enable = true;
      };

      home.packages = with pkgs; [
        spotify
        nerd-fonts.jetbrains-mono
        nerd-fonts.hack
        keepassxc
      ];
    };
}
