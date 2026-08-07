{ ... }:

{
  nixpkgs.config.allowUnfree = true;

  system.defaults = {
    NSGlobalDomain = {
      AppleIconAppearanceTheme = "RegularAutomatic";
      AppleInterfaceStyleSwitchesAutomatically = true;
      ApplePressAndHoldEnabled = false;
      AppleShowAllExtensions = true;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      "com.apple.swipescrolldirection" = false;
    };

    ".GlobalPreferences"."com.apple.mouse.scaling" = 0.875;

    dock = {
      autohide = true;
      mru-spaces = false;
    };

    finder = {
      FXDefaultSearchScope = "SCcf";
      FXPreferredViewStyle = "Nlsv";
      NewWindowTarget = "Home";
      ShowExternalHardDrivesOnDesktop = false;
      ShowHardDrivesOnDesktop = false;
      ShowMountedServersOnDesktop = false;
      ShowRemovableMediaOnDesktop = false;
    };

    controlcenter = {
      AirDrop = false;
      Bluetooth = true;
      Display = true;
      FocusModes = false;
      NowPlaying = false;
      Sound = false;
      BatteryShowPercentage = true;
    };

    menuExtraClock = {
      ShowAMPM = true;
      ShowDate = 1;
      ShowDayOfWeek = true;
    };

    universalaccess.reduceMotion = true;

    WindowManager = {
      EnableTiledWindowMargins = true;
      StandardHideWidgets = true;
    };

    CustomUserPreferences = {
      NSGlobalDomain = {
        "com.apple.mouse.linear" = true;
      };
      "com.apple.finder" = {
        FinderSpawnTab = false;
        ShowRecentTags = false;
      };
    };
  };
}
