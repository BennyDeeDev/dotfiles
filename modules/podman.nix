{
  nixos = { ... }: {
    virtualisation.podman.enable = true;
    virtualisation.oci-containers.backend = "podman";
  };

  homeManager = { pkgs, ... }: {
    home.packages = [ pkgs.podman ];
  };
}
