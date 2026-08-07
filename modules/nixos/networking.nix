{ ... }:

{
  networking.networkmanager.enable = true;
  users.users.benjamin.extraGroups = [ "networkmanager" ];
}
