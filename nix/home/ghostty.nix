{ pkgs, lib, ... }:

{
  home.packages = [ pkgs.ghostty ];

  xdg.terminal-exec = lib.mkIf pkgs.stdenv.isLinux {
    enable = true;
    settings.default = [ "com.mitchellh.ghostty.desktop" ];
  };

  xdg.configFile = {
    "ghostty/config".source = ../../ghostty/config;
    "ghostty/config-local".source =
      if pkgs.stdenv.isLinux then ../../ghostty/linux.conf else ../../ghostty/macos.conf;
    "ghostty/themes".source = ../../ghostty/themes;
  };
}
