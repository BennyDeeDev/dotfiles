{ pkgs, config, ... }:

{
  imports = [ ./ghostty.nix ./vscode.nix ];

  xdg.configFile."gtk-3.0/bookmarks".text = ''
    file:///home/benjamin/Documents
    file:///home/benjamin/Downloads
    file:///home/benjamin/Pictures
    file:///home/benjamin/Repos
    file:///home/benjamin/Backups
    file:///mnt/nas/benjamin NAS - Benjamin
    file:///mnt/nas/homelab NAS - Homelab
    file:///mnt/nas/ludusavi NAS - Ludusavi
  '';

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    documents = "${config.home.homeDirectory}/Documents";
    download = "${config.home.homeDirectory}/Downloads";
    pictures = "${config.home.homeDirectory}/Pictures";
    music = "${config.home.homeDirectory}/Music";
    videos = "${config.home.homeDirectory}/Videos";
    desktop = "${config.home.homeDirectory}/Desktop";
    templates = "${config.home.homeDirectory}/Templates";
    publicShare = "${config.home.homeDirectory}/Public";
    extraConfig = {
      REPOS = "${config.home.homeDirectory}/Repos";
      BACKUPS = "${config.home.homeDirectory}/Backups";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };

  home.packages = with pkgs; [
    # Media & audio
    playerctl
    pamixer
    pavucontrol
    libnotify
    ffmpegthumbnailer
    obs-studio
    celluloid

    # Network & bluetooth
    bluetui
    impala
    wiremix

    # File management
    nautilus
    baobab
    gnome-disk-utility
    gvfs

    # GNOME apps
    gnome-calculator
    gnome-characters
    gnome-font-viewer
    gnome-logs
    gnome-system-monitor
    loupe
    papers

    # Virtualization
    virt-manager

    # Themes & fonts
    gnome-themes-extra
    yaru-theme
    glib
    gsettings-desktop-schemas

    # Utilities
    xdg-utils
    xdg-terminal-exec
    sshpass
    libsecret
    keymapp
    asdbctl

    # Editors
    vscode

    # Browsers
    brave

    # Personal
    keepassxc
    spotify
    localsend
  ];
}
