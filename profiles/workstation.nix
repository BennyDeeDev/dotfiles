let
  applications = import ../modules/applications.nix;
  fonts = import ../modules/fonts.nix;
  zsh = import ../modules/zsh.nix;
  homeManager = import ../modules/home-manager.nix;
  cli = import ../modules/cli.nix;
  git = import ../modules/git.nix;
  ghostty = import ../modules/ghostty.nix;
  nvim = import ../modules/nvim.nix;
  vscode = import ../modules/vscode.nix;
  devops = import ../modules/devops.nix;
  opencode = import ../modules/opencode.nix;
  secrets = import ../modules/secrets.nix;

  niri = import ../modules/niri.nix;
  dms = import ../modules/dms.nix;
  podman = import ../modules/podman.nix;
  libvirt = import ../modules/libvirt.nix;

  base = import ../modules/nixos/base.nix;
  networking = import ../modules/nixos/networking.nix;
  boot = import ../modules/nixos/boot.nix;
  lanzaboote = import ../modules/nixos/lanzaboote.nix;
  graphics = import ../modules/nixos/graphics.nix;
  audio = import ../modules/nixos/audio.nix;
  bluetooth = import ../modules/nixos/bluetooth.nix;
  input = import ../modules/nixos/input.nix;
  printing = import ../modules/nixos/printing.nix;
  portals = import ../modules/nixos/portals.nix;
  polkit = import ../modules/nixos/polkit.nix;
  keyring = import ../modules/nixos/keyring.nix;
  smartcard = import ../modules/nixos/smartcard.nix;
  binfmt = import ../modules/nixos/binfmt.nix;
  btrfs = import ../modules/nixos/btrfs.nix;
  nas = import ../modules/nixos/nas.nix;

  linuxApplications = import ../modules/linux-applications.nix;
  linuxFonts = import ../modules/linux-fonts.nix;
  xdg = import ../modules/xdg.nix;
  wayland = import ../modules/wayland.nix;

  darwinHomebrew = import ../modules/darwin/homebrew.nix;
  darwinKeyboard = import ../modules/darwin/keyboard.nix;
  darwinSettings = import ../modules/darwin/settings.nix;
  darwinApplications = import ../modules/darwin/applications.nix;
in
{
  nixos = {
    imports = [
      base
      networking
      boot
      lanzaboote
      graphics
      audio
      bluetooth
      input
      printing
      portals
      polkit
      keyring
      smartcard
      binfmt
      btrfs
      nas
      niri.nixos
      dms.nixos
      podman.nixos
      libvirt.nixos
      secrets.nixos
    ];
  };

  darwin = {
    imports = [
      darwinHomebrew.darwin
      darwinKeyboard.darwin
      darwinSettings.darwin
    ];
  };

  homeManager = {
    common = {
      imports = [
        applications.homeManager
        fonts
        zsh
        homeManager
        cli
        git
        ghostty
        nvim
        vscode
        devops
        opencode
        secrets.homeManager
      ];
    };

    linux = {
      imports = [
        linuxApplications.homeManager
        linuxFonts.homeManager
        xdg.homeManager
        wayland.homeManager
        niri.homeManager
        dms.homeManager
      ];
    };

    darwin = {
      imports = [
        darwinApplications.homeManager
      ];
    };
  };
}
