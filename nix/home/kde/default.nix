{ ... }:

{
  programs.plasma = {
    enable = true;


    shortcuts = {
      "KDE Keyboard Layout Switcher" = {
        "Switch to Last-Used Keyboard Layout" = [ ];
        "Switch to Next Keyboard Layout" = [ ];
      };

      "kaccess"."Toggle Screen Reader On and Off" = [ ];

      "kmix" = {
        "decrease_microphone_volume" = "Microphone Volume Down";
        "decrease_volume" = "Volume Down";
        "decrease_volume_small" = [ ];
        "increase_microphone_volume" = "Microphone Volume Up";
        "increase_volume" = "Volume Up";
        "increase_volume_small" = [ ];
        "mic_mute" = "Microphone Mute";
        "mute" = "Volume Mute";
      };

      "ksmserver" = {
        "Lock Session" = "Ctrl+Shift+L";
        "Log Out" = "Ctrl+Shift+Q";
        "Halt Without Confirmation" = [ ];
        "Log Out Without Confirmation" = [ ];
        "LogOut" = [ ];
        "Reboot" = [ ];
        "Reboot Without Confirmation" = [ ];
        "Shut Down" = [ ];
      };

      "kwin" = {
        "Switch to Desktop 1" = "F1";
        "Switch to Desktop 2" = "F2";
        "Switch to Desktop 3" = "F3";
        "Switch to Desktop 4" = "F4";
        "Switch to Desktop 5" = "F5";
        "Switch to Desktop 6" = "F6";
        "Switch to Desktop 7" = "F7";
        "Switch to Desktop 8" = "F8";
        "Switch to Desktop 9" = "F9";
        "Switch to Desktop 10" = "F10";
        "Switch to Desktop 11" = [ ];
        "Switch to Desktop 12" = [ ];
        "Switch to Desktop 13" = [ ];
        "Switch to Desktop 14" = [ ];
        "Switch to Desktop 15" = [ ];
        "Switch to Desktop 16" = [ ];
        "Switch to Desktop 17" = [ ];
        "Switch to Desktop 18" = [ ];
        "Switch to Desktop 19" = [ ];
        "Switch to Desktop 20" = [ ];
        "Switch to Desktop 21" = [ ];
        "Switch to Desktop 22" = [ ];
        "Switch to Desktop 23" = [ ];
        "Switch to Desktop 24" = [ ];
        "Switch to Desktop 25" = [ ];
        "Switch to Next Desktop" = [ ];
        "Switch to Previous Desktop" = [ ];
        "Switch to Next Screen" = [ ];
        "Switch to Previous Screen" = [ ];
        "Switch to Screen 0" = [ ];
        "Switch to Screen 1" = [ ];
        "Switch to Screen 2" = [ ];
        "Switch to Screen 3" = [ ];
        "Switch to Screen 4" = [ ];
        "Switch to Screen 5" = [ ];
        "Switch to Screen 6" = [ ];
        "Switch to Screen 7" = [ ];
        "Switch to Screen Above" = [ ];
        "Switch to Screen Below" = [ ];
        "Switch to Screen to the Left" = [ ];
        "Switch to Screen to the Right" = [ ];
        "Window to Desktop 1" = "Shift+F1";
        "Window to Desktop 2" = "Shift+F2";
        "Window to Desktop 3" = "Shift+F3";
        "Window to Desktop 4" = "Shift+F4";
        "Window to Desktop 5" = "Shift+F5";
        "Window to Desktop 6" = "Shift+F6";
        "Window to Desktop 7" = "Shift+F7";
        "Window to Desktop 8" = "Shift+F8";
        "Window to Desktop 9" = "Shift+F9";
        "Window to Desktop 10" = "Shift+F10";
        "Window to Desktop 11" = [ ];
        "Window to Desktop 12" = [ ];
        "Window to Desktop 13" = [ ];
        "Window to Desktop 14" = [ ];
        "Window to Desktop 15" = [ ];
        "Window to Desktop 16" = [ ];
        "Window to Desktop 17" = [ ];
        "Window to Desktop 18" = [ ];
        "Window to Desktop 19" = [ ];
        "Window to Desktop 20" = [ ];
        "Window to Desktop 21" = [ ];
        "Window to Desktop 22" = [ ];
        "Window to Desktop 23" = [ ];
        "Window to Desktop 24" = [ ];
        "Window to Desktop 25" = [ ];
        "Window to Next Desktop" = [ ];
        "Window to Previous Desktop" = [ ];
        "Window to Next Screen" = "Meta+Shift+Right";
        "Window to Previous Screen" = "Meta+Shift+Left";
        "Window to Screen 0" = [ ];
        "Window to Screen 1" = [ ];
        "Window to Screen 2" = [ ];
        "Window to Screen 3" = [ ];
        "Window to Screen 4" = [ ];
        "Window to Screen 5" = [ ];
        "Window to Screen 6" = [ ];
        "Window to Screen 7" = [ ];
        "Walk Through Windows" = "Alt+Tab";
        "Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
        "Walk Through Windows Alternative" = [ ];
        "Walk Through Windows Alternative (Reverse)" = [ ];
        "Walk Through Windows of Current Application" = [ ];
        "Walk Through Windows of Current Application (Reverse)" = [ ];
        "Walk Through Windows of Current Application Alternative" = [ ];
        "Walk Through Windows of Current Application Alternative (Reverse)" = [ ];
        "Window Close" = "Ctrl+Q";
        "Window Quick Tile Left" = "Meta+Left";
        "Window Quick Tile Right" = "Meta+Right";
        "Window Quick Tile Top" = "Meta+Up";
        "Window Quick Tile Bottom" = "Meta+Down";
        "Window Quick Tile Bottom Left" = [ ];
        "Window Quick Tile Bottom Right" = [ ];
        "Window Quick Tile Top Left" = [ ];
        "Window Quick Tile Top Right" = [ ];
        "Window Maximize" = "Meta+PgUp";
        "Window Maximize Horizontal" = [ ];
        "Window Maximize Vertical" = [ ];
        "Window Minimize" = "Meta+PgDown";
        "Overview" = "Meta+W";
        "Show Desktop" = "Meta+D";
        "Activate Window Demanding Attention" = [ ];
        "Cycle Overview" = [ ];
        "Cycle Overview Opposite" = [ ];
        "Decrease Opacity" = [ ];
        "Edit Tiles" = [ ];
        "Expose" = [ ];
        "ExposeAll" = [ ];
        "ExposeClass" = [ ];
        "ExposeClassCurrentDesktop" = [ ];
        "Grid View" = [ ];
        "Increase Opacity" = [ ];
        "Kill Window" = [ ];
        "Move Tablet to Next LogicalOutput" = [ ];
        "MoveMouseToCenter" = [ ];
        "MoveMouseToFocus" = [ ];
        "MoveZoomDown" = [ ];
        "MoveZoomLeft" = [ ];
        "MoveZoomRight" = [ ];
        "MoveZoomUp" = [ ];
        "Setup Window Shortcut" = [ ];
        "Switch One Desktop Down" = [ ];
        "Switch One Desktop Up" = [ ];
        "Switch One Desktop to the Left" = [ ];
        "Switch One Desktop to the Right" = [ ];
        "Switch Window Down" = [ ];
        "Switch Window Left" = [ ];
        "Switch Window Right" = [ ];
        "Switch Window Up" = [ ];
        "Toggle Night Color" = [ ];
        "Toggle Window Raise/Lower" = [ ];
        "Window Above Other Windows" = [ ];
        "Window Below Other Windows" = [ ];
        "Window Custom Quick Tile Bottom" = [ ];
        "Window Custom Quick Tile Left" = [ ];
        "Window Custom Quick Tile Right" = [ ];
        "Window Custom Quick Tile Top" = [ ];
        "Window Fullscreen" = [ ];
        "Window Grow Horizontal" = [ ];
        "Window Grow Vertical" = [ ];
        "Window Lower" = [ ];
        "Window Move" = [ ];
        "Window Move Center" = [ ];
        "Window No Border" = [ ];
        "Window On All Desktops" = [ ];
        "Window One Desktop Down" = [ ];
        "Window One Desktop Up" = [ ];
        "Window One Desktop to the Left" = [ ];
        "Window One Desktop to the Right" = [ ];
        "Window One Screen Down" = [ ];
        "Window One Screen Up" = [ ];
        "Window One Screen to the Left" = [ ];
        "Window One Screen to the Right" = [ ];
        "Window Operations Menu" = [ ];
        "Window Pack Down" = [ ];
        "Window Pack Left" = [ ];
        "Window Pack Right" = [ ];
        "Window Pack Up" = [ ];
        "Window Raise" = [ ];
        "Window Resize" = [ ];
        "Window Shrink Horizontal" = [ ];
        "Window Shrink Vertical" = [ ];
        "disableInputCapture" = [ ];
        "view_actual_size" = [ ];
        "view_zoom_in" = [ ];
        "view_zoom_out" = [ ];
      };

      "mediacontrol" = {
        "mediavolumedown" = [ ];
        "mediavolumeup" = [ ];
        "nextmedia" = "Media Next";
        "pausemedia" = "Media Pause";
        "playmedia" = [ ];
        "playpausemedia" = "Media Play";
        "previousmedia" = "Media Previous";
        "seekbackwardmedia" = "Media Rewind";
        "seekbackwardmedialong" = [ ];
        "seekforwardmedia" = "Media Fast Forward";
        "seekforwardmedialong" = [ ];
        "stopmedia" = "Media Stop";
      };

      "org_kde_powerdevil" = {
        "Decrease Screen Brightness" = "Monitor Brightness Down";
        "Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
        "Hibernate" = "Hibernate";
        "Increase Screen Brightness" = "Monitor Brightness Up";
        "Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
        "PowerDown" = "Power Down";
        "PowerOff" = "Power Off";
        "Sleep" = "Sleep";
        "Turn Off Screen" = [ ];
        "powerProfile" = "Battery";
      };

      "plasmashell" = {
        "activate application launcher" = "Meta";
        "activate task manager entry 1" = "Meta+1";
        "activate task manager entry 2" = "Meta+2";
        "activate task manager entry 3" = "Meta+3";
        "activate task manager entry 4" = "Meta+4";
        "activate task manager entry 5" = "Meta+5";
        "activate task manager entry 6" = "Meta+6";
        "activate task manager entry 7" = "Meta+7";
        "activate task manager entry 8" = "Meta+8";
        "activate task manager entry 9" = "Meta+9";
        "activate task manager entry 10" = [ ];
        "clear-history" = [ ];
        "clipboard_action" = [ ];
        "cycle-panels" = [ ];
        "cycleNextAction" = [ ];
        "cyclePrevAction" = [ ];
        "edit_clipboard" = [ ];
        "manage activities" = [ ];
        "next activity" = [ ];
        "previous activity" = [ ];
        "repeat_action" = [ ];
        "show dashboard" = [ ];
        "show-barcode" = [ ];
        "show-on-mouse-pos" = [ ];
        "switch to next activity" = [ ];
        "switch to previous activity" = [ ];
        "toggle do not disturb" = [ ];
      };

      "services/com.mitchellh.ghostty.desktop"."_launch" = "Ctrl+Shift+T";
      "services/brave-browser.desktop"."_launch" = "Ctrl+Shift+B";
      "services/code.desktop"."_launch" = "Ctrl+Shift+E";
      "services/org.keepassxc.KeePassXC.desktop"."_launch" = "Ctrl+Shift+P";
      "services/com.spotify.Client.desktop"."_launch" = "Ctrl+Shift+S";
      "services/org.kde.dolphin.desktop"."_launch" = "Ctrl+Shift+F";
      "services/org.kde.konsole.desktop"."_launch" = [ ];
      "services/org.kde.krunner.desktop"."_launch" = [ ];
      "services/org.kde.krunner.desktop"."RunClipboard" = [ ];
      "services/org.kde.kscreen.desktop"."ShowOSD" = [ ];
      "services/org.kde.plasma-systemmonitor.desktop"."_launch" = [ ];
      "services/org.kde.plasma.emojier.desktop"."_launch" = [ ];
      "services/org.kde.touchpadshortcuts.desktop"."ToggleTouchpad" = "Touchpad Toggle";
      "services/systemsettings.desktop"."_launch" = [ ];
      "services/org.kde.spectacle.desktop" = {
        "_launch" = [ ];
        "ActiveWindowScreenShot" = [ ];
        "FullScreenScreenShot" = [ ];
        "RecordRegion" = [ ];
        "RecordScreen" = [ ];
        "RecordWindow" = [ ];
        "RectangularRegionScreenShot" = [ ];
        "WindowUnderCursorScreenShot" = [ ];
      };
    };

    panels = [
      {
        location = "top";
        widgets = [
          "org.kde.plasma.lock_logout"
          "org.kde.plasma.pager"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.mediacontroller"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.panelspacer"
          {
            name = "org.kde.plasma.systemtray";
            config.General = {
              shownItems = "org.kde.plasma.notifications";
              extraItems = "org.kde.kdeconnect,org.kde.plasma.bluetooth,org.kde.plasma.brightness,org.kde.plasma.cameraindicator,org.kde.plasma.clipboard,org.kde.plasma.devicenotifier,org.kde.plasma.keyboardlayout,org.kde.plasma.networkmanagement,org.kde.kscreen,org.kde.plasma.mediacontroller,org.kde.plasma.volume,org.kde.plasma.battery,org.kde.plasma.notifications";
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.digitalclock"
        ];
      }
      {
        location = "bottom";
        widgets = [
          {
            name = "org.kde.plasma.icontasks";
            config.General = {
              launchers = "preferred://filemanager,applications:systemsettings.desktop,preferred://browser,applications:com.mitchellh.ghostty.desktop,applications:com.spotify.Client.desktop,applications:org.keepassxc.KeePassXC.desktop";
              showOnlyCurrentDesktop = "false";
              showOnlyCurrentActivity = "false";
            };
          }
        ];
      }
    ];

    configFile = {
      kwinrc.Desktops.Number = 10;
      kwinrc.Desktops.Rows = 1;
      kdeglobals.KDE.AnimationDurationFactor = 0;
      kwinrc.Plugins.slideEnabled = false;
      kwinrc.Xwayland.Scale = 2;
      kiorc.Confirmations.ConfirmEmptyTrash = true;
      "kwalletrc"."Wallet"."First Use" = false;
      kded5rc."Module-device_automounter".autoload = false;
    };
  };
}
