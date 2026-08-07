{ ... }:

{
  services.hyprsunset.enable = true;

  xdg.configFile."hypr/hyprsunset.conf".source = ../../../hypr/hyprsunset.conf;
}
