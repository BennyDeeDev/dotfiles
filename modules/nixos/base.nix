{ pkgs, config, ... }:

{
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  console.keyMap = "us";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    fuse
    gcc
  ];
  environment.variables.EDITOR = "vim";

  zramSwap.enable = true;
  services.envfs.enable = true;
  programs.nix-ld.enable = true;

  programs.zsh.enable = true;

  security.sudo.extraConfig = ''
    Defaults timestamp_type=tty,timestamp_timeout=-1
  '';

  sops.secrets."benjamin-password" = {
    sopsFile = ../../secrets/common.yaml;
    neededForUsers = true;
  };

  users.users.benjamin = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
    hashedPasswordFile = config.sops.secrets."benjamin-password".path;
  };
}
