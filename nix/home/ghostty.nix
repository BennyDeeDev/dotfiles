{ pkgs, ... }:

{
  home.packages = [ pkgs.ghostty ];

  xdg.configFile = {
    "ghostty/config".source = ../../ghostty/config;
    "ghostty/config-local".source =
      if pkgs.stdenv.isLinux then ../../ghostty/linux.conf
      else ../../ghostty/macos.conf;
    "ghostty/themes".source = ../../ghostty/themes;
  };
}
