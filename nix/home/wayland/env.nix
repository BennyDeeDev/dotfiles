{ ... }:

{
  home.sessionVariables = {
    GDK_BACKEND = "wayland,x11,*";
    GDK_SCALE = "2";
    ELECTRON_FORCE_DEVICE_SCALE_FACTOR = "2";
    AVALONIA_GLOBAL_SCALE_FACTOR= "2";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_STYLE_OVERRIDE = "kvantum";
    SDL_VIDEODRIVER = "wayland,x11";
    MOZ_ENABLE_WAYLAND = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";
    OZONE_PLATFORM = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
