{ config, lib, ... }:

{
  system.defaults.CustomUserPreferences = {
    "com.apple.HIToolbox" = {
      AppleEnabledInputSources = [
        {
          InputSourceKind = "Keyboard Layout";
          "KeyboardLayout ID" = 0;
          "KeyboardLayout Name" = "U.S.";
        }
        {
          InputSourceKind = "Keyboard Layout";
          "KeyboardLayout ID" = 3;
          "KeyboardLayout Name" = "German";
        }
      ];
      AppleSelectedInputSources = [
        {
          InputSourceKind = "Keyboard Layout";
          "KeyboardLayout ID" = 0;
          "KeyboardLayout Name" = "U.S.";
        }
      ];
    };

    "com.apple.symbolichotkeys".AppleSymbolicHotKeys = {
      "118" = {
        enabled = true;
        value = {
          type = "standard";
          parameters = [ 65535 122 8388608 ];
        };
      };
      "119" = {
        enabled = true;
        value = {
          type = "standard";
          parameters = [ 65535 120 8388608 ];
        };
      };
      "120" = {
        enabled = true;
        value = {
          type = "standard";
          parameters = [ 65535 99 8388608 ];
        };
      };
      "121" = {
        enabled = true;
        value = {
          type = "standard";
          parameters = [ 65535 118 8388608 ];
        };
      };
      "122" = {
        enabled = true;
        value = {
          type = "standard";
          parameters = [ 65535 96 8388608 ];
        };
      };
      "123" = {
        enabled = true;
        value = {
          type = "standard";
          parameters = [ 65535 97 8388608 ];
        };
      };
      "124" = {
        enabled = true;
        value = {
          type = "standard";
          parameters = [ 65535 98 8388608 ];
        };
      };
      "125" = {
        enabled = true;
        value = {
          type = "standard";
          parameters = [ 65535 100 8388608 ];
        };
      };
      "126" = {
        enabled = true;
        value = {
          type = "standard";
          parameters = [ 65535 101 8388608 ];
        };
      };
      "127" = {
        enabled = true;
        value = {
          type = "standard";
          parameters = [ 65535 109 8388608 ];
        };
      };
    };
  };

  system.activationScripts.postActivation.text = lib.mkAfter ''
    sudo -u ${config.system.primaryUser} \
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';
}
