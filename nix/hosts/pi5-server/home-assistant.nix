{ ... }:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/homeassistant 0755 root root -"
    "d /var/lib/otbr 0755 root root -"
    "d /var/lib/matter-server 0755 1000 1000 -"
  ];

  virtualisation.oci-containers.containers.homeassistant = {
    image = "ghcr.io/home-assistant/home-assistant:stable";
    extraOptions = [
      "--network=host"
      "--cap-add=NET_ADMIN"
      "--cap-add=NET_RAW"
    ];
    environment.TZ = "Europe/Berlin";
    volumes = [
      "/var/lib/homeassistant:/config:rw"
    ];
  };

  virtualisation.oci-containers.containers.otbr = {
    image = "docker.io/openthread/border-router:latest";
    extraOptions = [
      "--network=host"
      "--cap-add=NET_ADMIN"
      "--cap-add=NET_RAW"
      "--device=/dev/serial/by-id/usb-Nabu_Casa_ZBT-2_94A990D189AC-if00:/dev/ttyACM0"
      "--device=/dev/net/tun:/dev/net/tun"
    ];
    environment = {
      TZ = "Europe/Berlin";
      OT_RCP_DEVICE = "spinel+hdlc+uart:///dev/ttyACM0?uart-baudrate=460800";
      OT_INFRA_IF = "end0";
      OT_THREAD_IF = "wpan0";
      OT_REST_LISTEN_ADDR = "0.0.0.0";
      OT_REST_LISTEN_PORT = "8081";
    };
    volumes = [
      "/var/lib/otbr:/data:rw"
    ];
  };

  virtualisation.oci-containers.containers.matter-server = {
    image = "ghcr.io/matter-js/matterjs-server:stable";
    extraOptions = [
      "--network=host"
      "--security-opt=apparmor=unconfined"
      "--cap-add=NET_ADMIN"
      "--cap-add=NET_RAW"
    ];
    environment = {
      TZ = "Europe/Berlin";
      PRIMARY_INTERFACE = "end0";
    };
    volumes = [
      "/var/lib/matter-server:/data:rw"
    ];
  };

  networking.firewall.allowedTCPPorts = [ 8123 ];
}
