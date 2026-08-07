{
  nixos = { ... }: {
    virtualisation.libvirtd.enable = true;
    users.users.benjamin.extraGroups = [ "libvirtd" ];
  };

  homeManager = { pkgs, ... }: {
    home.packages = [ pkgs.virt-manager ];
  };
}
