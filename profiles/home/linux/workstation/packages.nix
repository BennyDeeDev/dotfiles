{ pkgs, ... }:

{
  home.packages = with pkgs; [
    playerctl
    pamixer
    pavucontrol
    pulseaudio
    libnotify
    ffmpegthumbnailer
    showtime
    bluetui
    impala
    wiremix
    nautilus
    baobab
    gnome-disk-utility
    gvfs
    gnome-calculator
    gnome-characters
    gnome-font-viewer
    gnome-logs
    gnome-system-monitor
    gnome-weather
    loupe
    papers
    virt-manager
    gnome-themes-extra
    yaru-theme
    glib
    gsettings-desktop-schemas
    xdg-utils
    xdg-terminal-exec
    sshpass
    libsecret
    keymapp
    asdbctl
    lldb
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };
}
