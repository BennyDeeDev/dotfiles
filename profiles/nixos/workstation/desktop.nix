{ pkgs, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.printing.enable = true;
  environment.systemPackages = with pkgs; [
    cups-pk-helper
    efibootmgr
  ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.keyboard.zsa.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
      FastConnectable = true;
    };
    Policy.AutoEnable = true;
  };
  services.blueman.enable = true;
  services.pcscd.enable = true;

  services.udev.packages = [ pkgs.asdbctl ];

  programs.dconf.enable = true;

  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };
  services.displayManager.defaultSession = "niri";

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/benjamin";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
    options = "compose:ralt";
  };

  # Allow users to write brave theme policy (used by omarchy-theme-set)
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  networking.firewall = {
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
  };

  security.sudo.extraRules = [
    {
      users = [ "benjamin" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/efibootmgr";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

}
