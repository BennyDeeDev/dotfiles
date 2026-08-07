{ ... }:

{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
      monospace = [ "Hack Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
