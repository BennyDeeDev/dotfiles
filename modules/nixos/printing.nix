{ pkgs, ... }:

{
  services.printing.enable = true;
  environment.systemPackages = [ pkgs.cups-pk-helper ];
}
