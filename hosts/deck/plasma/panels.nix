let
  fixedSpacer = {
    panelSpacer = {
      expanding = false;
      length = 10;
    };
  };

  expandingSpacer = {
    panelSpacer.expanding = true;
  };
in
{
  programs.plasma.panels = [
    {
      location = "top";
      height = 34;
      floating = true;
      widgets = [
        "org.kde.plasma.lock_logout"
        "org.kde.plasma.pager"
        expandingSpacer
        "org.kde.plasma.mediacontroller"
        expandingSpacer
        "org.kde.plasma.cameraindicator"
        fixedSpacer
        "org.kde.plasma.volume"
        fixedSpacer
        "org.kde.plasma.networkmanagement"
        fixedSpacer
        "org.kde.plasma.bluetooth"
        fixedSpacer
        "org.kde.plasma.brightness"
        fixedSpacer
        {
          systemMonitor = {
            title = "Total CPU Use";
            displayStyle = "org.kde.ksysguard.piechart";
            sensors = [
              {
                name = "cpu/all/usage";
                color = "86,159,204";
                label = "CPU";
              }
            ];
            totalSensors = [ "cpu/all/usage" ];
            textOnlySensors = [
              "cpu/all/cpuCount"
              "cpu/all/coreCount"
            ];
          };
        }
        fixedSpacer
        {
          systemMonitor = {
            title = "Memory Usage";
            displayStyle = "org.kde.ksysguard.piechart";
            sensors = [
              {
                name = "memory/physical/used";
                color = "86,159,204";
                label = "Memory";
              }
            ];
            totalSensors = [ "memory/physical/usedPercent" ];
            textOnlySensors = [ "memory/physical/total" ];
          };
        }
        fixedSpacer
        "org.kde.plasma.battery"
        "org.kde.plasma.marginsseparator"
        {
          digitalClock = {
            date = {
              enable = true;
              format = "longDate";
            };
            time = {
              format = "24h";
              showSeconds = "never";
            };
            font = {
              family = "Noto Sans";
              size = 11;
              weight = 400;
              style = "Regular";
            };
          };
        }
      ];
    }
    {
      location = "bottom";
      height = 64;
      floating = true;
      lengthMode = "fit";
      hiding = "autohide";
      widgets = [
        {
          kickoff.icon = "distributor-logo-steamdeck";
        }
        {
          iconTasks = {
            iconsOnly = true;
            launchers = [
              "applications:brave-browser.desktop"
              "applications:com.mitchellh.ghostty.desktop"
              "applications:code.desktop"
              "applications:steam.desktop"
              "applications:spotify.desktop"
              "applications:org.keepassxc.KeePassXC.desktop"
              "preferred://filemanager"
              "applications:systemsettings.desktop"
            ];
            behavior = {
              minimizeActiveTaskOnClick = false;
              showTasks = {
                onlyInCurrentActivity = false;
                onlyInCurrentDesktop = false;
              };
            };
          };
        }
      ];
    }
  ];
}
