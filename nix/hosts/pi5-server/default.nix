{ ... }:

{
  imports = [
    ../../modules/pi5.nix
    ../../modules/nas.nix
    ./home-assistant.nix
  ];

  networking.hostName = "pi5-server";

  # Firewall disabled temporarily
  networking.firewall.enable = false;

  virtualisation.podman.enable = true;
  virtualisation.oci-containers.backend = "podman";

  host.nas = {
    sopsFile = ../../secrets/pi5-server.yaml;
    shares = [ "Homelab" ];
  };
}
