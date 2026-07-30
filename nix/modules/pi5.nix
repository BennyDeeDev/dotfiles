{ pkgs, config, ... }:

{
  imports = [ ./sops.nix ];

  # Mainline kernel — cached, fast build. Overrides the nixos-hardware vendor pin.
  boot.kernelPackages = pkgs.linuxPackages;

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
  };

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  sops.secrets."benjamin-password" = {
    sopsFile = ../secrets/common.yaml;
    neededForUsers = true;
    owner = "root";
    group = "root";
    mode = "0400";
  };

  users.users.benjamin = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
    hashedPasswordFile = config.sops.secrets."benjamin-password".path;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHW2qr7cup1ALuIpnhUoJP8dLjv/yhGfuh/1Vni2lSbd"
    ];
  };

  programs.zsh.enable = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "us";

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = [ "benjamin" ];

  system.stateVersion = "26.05";
}
