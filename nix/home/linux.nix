{
  pkgs,
  config,
  lib,
  dotfiles,
  ...
}:

{
  imports = [
    ./ghostty.nix
    ./vscode.nix
    ./nvim.nix
  ];

  home.packages = with pkgs; [
    # Ai
    claude-code

    # Media & audio
    playerctl
    pamixer
    pavucontrol
    libnotify
    ffmpegthumbnailer
    obs-studio
    showtime

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
    gnome-weather
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
    lldb

    # Gamedev
    aseprite
    godot

    # Browsers
    brave

    # Personal
    keepassxc
    spotify
    localsend
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
  };

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
      VMS = "${config.home.homeDirectory}/VMs";
    };
  };

  home.file.".claude/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/settings.json";

  xdg.configFile."godot".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/godot";

  xdg.configFile."gtk-3.0/bookmarks".text = ''
    file://${config.home.homeDirectory}/Documents
    file://${config.home.homeDirectory}/Downloads
    file://${config.home.homeDirectory}/Pictures
    file://${config.home.homeDirectory}/Repos
    file://${config.home.homeDirectory}/Backups
    file:///mnt/nas/benjamin NAS - Benjamin
    file:///mnt/nas/homelab NAS - Homelab
    file:///mnt/nas/ludusavi NAS - Ludusavi
  '';

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Browser
      "text/html" = "brave-browser.desktop";
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";
      "x-scheme-handler/mailto" = "brave-browser.desktop";

      # Files
      "inode/directory" = "org.gnome.Nautilus.desktop";

      # Images
      "image/png" = "org.gnome.Loupe.desktop";
      "image/jpeg" = "org.gnome.Loupe.desktop";
      "image/gif" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "image/bmp" = "org.gnome.Loupe.desktop";
      "image/tiff" = "org.gnome.Loupe.desktop";

      # PDF
      "application/pdf" = "org.gnome.Papers.desktop";

      # Video
      "video/mp4" = "io.github.celluloid_player.Celluloid.desktop";
      "video/x-msvideo" = "io.github.celluloid_player.Celluloid.desktop";
      "video/x-matroska" = "io.github.celluloid_player.Celluloid.desktop";
      "video/x-flv" = "io.github.celluloid_player.Celluloid.desktop";
      "video/x-ms-wmv" = "io.github.celluloid_player.Celluloid.desktop";
      "video/mpeg" = "io.github.celluloid_player.Celluloid.desktop";
      "video/ogg" = "io.github.celluloid_player.Celluloid.desktop";
      "video/webm" = "io.github.celluloid_player.Celluloid.desktop";
      "video/quicktime" = "io.github.celluloid_player.Celluloid.desktop";
      "video/3gpp" = "io.github.celluloid_player.Celluloid.desktop";
      "video/3gpp2" = "io.github.celluloid_player.Celluloid.desktop";
      "video/x-ms-asf" = "io.github.celluloid_player.Celluloid.desktop";
      "video/x-ogm+ogg" = "io.github.celluloid_player.Celluloid.desktop";
      "video/x-theora+ogg" = "io.github.celluloid_player.Celluloid.desktop";
      "application/ogg" = "io.github.celluloid_player.Celluloid.desktop";

      # Text / code
      "text/plain" = "code.desktop";
      "text/x-makefile" = "code.desktop";
      "text/x-c++hdr" = "code.desktop";
      "text/x-c++src" = "code.desktop";
      "text/x-chdr" = "code.desktop";
      "text/x-csrc" = "code.desktop";
      "text/x-java" = "code.desktop";
      "text/x-pascal" = "code.desktop";
      "text/x-tcl" = "code.desktop";
      "text/x-tex" = "code.desktop";
      "text/x-c" = "code.desktop";
      "text/x-c++" = "code.desktop";
      "text/xml" = "code.desktop";
      "application/xml" = "code.desktop";
      "application/x-shellscript" = "code.desktop";
    };
  };
}
