{ config, ... }:

{
  acLockTimeout = 0;
  acMonitorTimeout = 0;
  acPostLockMonitorTimeout = 0;
  acProfileName = "";
  acSuspendBehavior = 0;
  acSuspendTimeout = 0;
  activeDisplayProfile = { };
  animationSpeed = 1;
  animationVariant = 0;
  appDrawerSectionViewModes = { };
  appIdSubstitutions = [
    {
      pattern = "Spotify";
      replacement = "spotify";
      type = "exact";
    }
    {
      pattern = "beepertexts";
      replacement = "beeper";
      type = "exact";
    }
    {
      pattern = "home assistant desktop";
      replacement = "homeassistant-desktop";
      type = "exact";
    }
    {
      pattern = "com.transmissionbt.transmission";
      replacement = "transmission-gtk";
      type = "contains";
    }
    {
      pattern = "^steam_app_(\\d+)$";
      replacement = "steam_icon_$1";
      type = "regex";
    }
  ];
  appLauncherGridColumns = 4;
  appLauncherViewMode = "list";
  appPickerViewMode = "grid";
  appsDockActiveColorMode = "primary";
  appsDockColorizeActive = false;
  appsDockEnlargeOnHover = false;
  appsDockEnlargePercentage = 125;
  appsDockHideIndicators = false;
  appsDockIconSizePercentage = 100;
  audioDeviceScrollVolumeEnabled = false;
  audioInputDevicePins = { };
  audioOutputDevicePins = { };
  audioScrollMode = "volume";
  audioVisualizerEnabled = true;
  audioWheelScrollAmount = 5;
  barConfigs = [
    {
      autoHide = false;
      autoHideDelay = 250;
      borderColor = "surfaceText";
      borderEnabled = false;
      borderOpacity = 1;
      borderThickness = 1;
      bottomGap = 0;
      centerWidgets = [
        {
          enabled = true;
          id = "music";
          mediaSize = 3;
        }
      ];
      enabled = true;
      fontScale = 1;
      gothCornerRadiusOverride = false;
      gothCornerRadiusValue = 12;
      gothCornersEnabled = false;
      id = "default";
      innerPadding = 4;
      leftWidgets = [
        "launcherButton"
        {
          enabled = true;
          id = "workspaceSwitcher";
        }
      ];
      name = "Main Bar";
      noBackground = false;
      openOnOverview = false;
      popupGapsAuto = true;
      popupGapsManual = 4;
      position = 0;
      rightWidgets = [
        {
          enabled = true;
          id = "privacyIndicator";
        }
        "clipboard"
        {
          enabled = true;
          id = "cpuUsage";
          minimumWidth = false;
        }
        {
          enabled = true;
          id = "cpuTemp";
          minimumWidth = true;
        }
        {
          enabled = true;
          id = "memUsage";
          showInGb = true;
          showSwap = false;
        }
        "notificationButton"
        "battery"
        "controlCenterButton"
        {
          enabled = true;
          id = "spacer";
          size = 20;
        }
        "weather"
        "clock"
      ];
      screenPreferences = [ "all" ];
      shadowIntensity = 0;
      showOnLastDisplay = true;
      spacing = 4;
      squareCorners = false;
      transparency = 1;
      visible = true;
      widgetOutlineEnabled = false;
      widgetTransparency = 1;
    }
  ];
  barElevationEnabled = false;
  barInsetPaddingShared = -1;
  barInsetPaddingSyncAll = false;
  barMaxVisibleApps = 0;
  barMaxVisibleRunningApps = 0;
  barShowOverflowBadge = true;
  batteryAutoPowerSaver = false;
  batteryChargeLimit = 100;
  batteryChargeLimitNotificationType = 0;
  batteryCriticalNotificationType = 1;
  batteryCriticalThreshold = 10;
  batteryLockTimeout = 0;
  batteryLowNotificationType = 0;
  batteryLowThreshold = 20;
  batteryMonitorTimeout = 0;
  batteryNotifyChargeLimit = false;
  batteryNotifyCritical = true;
  batteryNotifyLow = false;
  batteryPillPercentSign = false;
  batteryPillStyle = false;
  batteryPostLockMonitorTimeout = 0;
  batteryProfileName = "";
  batterySuspendBehavior = 0;
  batterySuspendTimeout = 0;
  bluetoothDevicePins = { };
  blurBorderColor = "outline";
  blurBorderCustomColor = "#ffffff";
  blurBorderOpacity = 0.35;
  blurEnabled = false;
  blurForegroundLayers = true;
  blurLayerOutlineOpacity = 0.12;
  blurWallpaperOnOverview = false;
  blurredWallpaperLayer = false;
  brightnessDevicePins = { };
  browserPickerViewMode = "grid";
  browserUsageHistory = { };
  builtInPluginSettings = {
    dms_clipboard_search = {
      trigger = "cb";
    };
    dms_settings_search = {
      trigger = "?";
    };
  };
  buttonColorMode = "primary";
  calendarBackend = "auto";
  centeringMode = "index";
  clipboardClickToPaste = false;
  clipboardEnterToPaste = false;
  clipboardRememberTypeFilter = false;
  clipboardTypeFilter = "all";
  clipboardVisibleEntryActions = [
    "pin"
    "edit"
    "delete"
  ];
  clockCompactMode = false;
  clockDateFormat = "";
  configVersion = 12;
  connectedFrameBarStyleBackups = { };
  controlCenterShowAudioIcon = true;
  controlCenterShowAudioPercent = false;
  controlCenterShowBatteryIcon = false;
  controlCenterShowBluetoothIcon = true;
  controlCenterShowBrightnessIcon = false;
  controlCenterShowBrightnessPercent = false;
  controlCenterShowDoNotDisturbIcon = false;
  controlCenterShowIdleInhibitorIcon = false;
  controlCenterShowMicIcon = false;
  controlCenterShowMicPercent = false;
  controlCenterShowNetworkIcon = true;
  controlCenterShowPrinterIcon = false;
  controlCenterShowScreenSharingIcon = true;
  controlCenterShowVpnIcon = true;
  controlCenterTileColorMode = "primary";
  controlCenterWidgets = [
    {
      enabled = true;
      id = "volumeSlider";
      width = 50;
    }
    {
      enabled = true;
      id = "brightnessSlider";
      width = 50;
    }
    {
      enabled = true;
      id = "wifi";
      width = 50;
    }
    {
      enabled = true;
      id = "bluetooth";
      width = 50;
    }
    {
      enabled = true;
      id = "audioOutput";
      width = 50;
    }
    {
      enabled = true;
      id = "audioInput";
      width = 50;
    }
    {
      enabled = true;
      id = "nightMode";
      width = 50;
    }
    {
      enabled = true;
      id = "darkMode";
      width = 50;
    }
  ];
  cornerRadius = 16;
  currentThemeCategory = "generic";
  currentThemeName = "custom";
  cursorSettings = {
    dwl = {
      cursorHideTimeout = 0;
    };
    hyprland = {
      hideOnKeyPress = false;
      hideOnTouch = false;
      inactiveTimeout = 0;
    };
    mango = {
      cursorHideTimeout = 0;
    };
    niri = {
      hideAfterInactiveMs = 0;
      hideWhenTyping = false;
    };
    size = 24;
    theme = "System Default";
  };
  customAnimationDuration = 500;
  customPowerActionHibernate = "";
  customPowerActionLock = "";
  customPowerActionLogout = "";
  customPowerActionPowerOff = "";
  customPowerActionReboot = "";
  customPowerActionSuspend = "";
  customThemeFile = "${config.xdg.configHome}/DankMaterialShell/themes/catppuccin.json";
  dankLauncherV2BorderColor = "primary";
  dankLauncherV2BorderEnabled = false;
  dankLauncherV2BorderThickness = 2;
  dankLauncherV2IncludeFilesInAll = false;
  dankLauncherV2IncludeFoldersInAll = false;
  dankLauncherV2ShowFooter = true;
  dankLauncherV2ShowSourceBadges = true;
  dankLauncherV2Size = "compact";
  dankLauncherV2UnloadOnClose = false;
  dashTabs = [
    {
      enabled = true;
      id = "overview";
    }
    {
      enabled = true;
      id = "media";
    }
    {
      enabled = true;
      id = "wallpaper";
    }
    {
      enabled = true;
      id = "weather";
    }
    {
      enabled = true;
      id = "settings";
    }
  ];
  desktopClockColorMode = "primary";
  desktopClockCustomColor = {
    a = 1;
    b = 1;
    g = 1;
    hslHue = -1;
    hslLightness = 1;
    hslSaturation = 0;
    hsvHue = -1;
    hsvSaturation = 0;
    hsvValue = 1;
    r = 1;
    valid = true;
  };
  desktopClockDisplayPreferences = [ "all" ];
  desktopClockEnabled = false;
  desktopClockHeight = 180;
  desktopClockShowAnalogNumbers = false;
  desktopClockShowAnalogSeconds = true;
  desktopClockShowDate = true;
  desktopClockStyle = "analog";
  desktopClockTransparency = 0.8;
  desktopClockWidth = 280;
  desktopClockX = -1;
  desktopClockY = -1;
  desktopWidgetGridSettings = { };
  desktopWidgetGroups = [ ];
  desktopWidgetInstances = [ ];
  desktopWidgetPositions = { };
  displayNameMode = "system";
  displayProfileAutoSelect = false;
  displayProfiles = { };
  displayShowDisconnected = false;
  displaySnapToEdge = true;
  dockAutoHide = true;
  dockBorderColor = "surfaceText";
  dockBorderEnabled = false;
  dockBorderOpacity = 1;
  dockBorderThickness = 1;
  dockBottomGap = 0;
  dockGroupByApp = false;
  dockIconSize = 40;
  dockIndicatorStyle = "circle";
  dockIsolateDisplays = false;
  dockLauncherEnabled = true;
  dockLauncherLogoBrightness = 0.5;
  dockLauncherLogoColorOverride = "";
  dockLauncherLogoContrast = 1;
  dockLauncherLogoCustomPath = "";
  dockLauncherLogoMode = "os";
  dockLauncherLogoSizeOffset = 0;
  dockMargin = 0;
  dockMaxVisibleApps = 0;
  dockMaxVisibleRunningApps = 0;
  dockOpenOnOverview = false;
  dockPosition = 1;
  dockRestoreSpecialWorkspaceOnClick = false;
  dockShowOverflowBadge = true;
  dockShowTrash = true;
  dockSmartAutoHide = false;
  dockSpacing = 4;
  dockTransparency = 1;
  dockTrashCustomCommand = "";
  dockTrashFileManager = "default";
  dockUseOverlayLayer = false;
  dwlShowAllTags = false;
  enableFprint = false;
  enableRippleEffects = true;
  enableU2f = false;
  enabledGpuPciIds = [ ];
  fadeToDpmsEnabled = true;
  fadeToDpmsGracePeriod = 5;
  fadeToLockEnabled = true;
  fadeToLockGracePeriod = 5;
  filePickerUsageHistory = { };
  firstDayOfWeek = -1;
  focusedWindowCompactMode = false;
  focusedWindowShowIcon = true;
  focusedWindowSize = 1;
  fontFamily = "Inter Variable";
  fontScale = 1;
  fontWeight = 400;
  frameBarInsetPadding = -1;
  frameBarSize = 40;
  frameBlurEnabled = true;
  frameCloseGaps = true;
  frameColor = "";
  frameEnabled = false;
  frameLauncherArcExtender = false;
  frameLauncherEdgeHover = false;
  frameLauncherEmergeSide = "bottom";
  frameMode = "connected";
  frameOpacity = 1;
  frameRounding = 23;
  frameScreenPreferences = [ "all" ];
  frameShowOnOverview = false;
  frameThickness = 16;
  greeterAutoLogin = false;
  greeterEnableFprint = false;
  greeterEnableU2f = false;
  greeterFontFamily = "";
  greeterLockDateFormat = "";
  greeterPadHours12Hour = false;
  greeterRememberLastSession = true;
  greeterRememberLastUser = true;
  greeterShowSeconds = false;
  greeterSyncBaseline = { };
  greeterSyncPending = false;
  greeterUse24HourClock = true;
  greeterWallpaperFillMode = "";
  greeterWallpaperPath = "";
  groupActiveWorkspaceApps = false;
  groupWorkspaceApps = false;
  gtkThemingEnabled = false;
  hideBrightnessSlider = false;
  hyprlandLayoutBorderSize = -1;
  hyprlandLayoutGapsOutOverride = -1;
  hyprlandLayoutGapsOverride = -1;
  hyprlandLayoutRadiusOverride = -1;
  hyprlandOutputSettings = { };
  hyprlandResizeOnBorder = false;
  iconThemeDark = "System Default";
  iconThemeLight = "System Default";
  iconThemePerMode = false;
  keybindsFloatingWindow = false;
  keyboardLayoutNameCompactMode = false;
  keyboardLayoutNameShowIcon = false;
  lastAppliedIconTheme = "";
  launchPrefix = "";
  launcherLogoBrightness = 0.5;
  launcherLogoColorInvertOnMode = false;
  launcherLogoColorOverride = "";
  launcherLogoContrast = 1;
  launcherLogoCustomPath = "";
  launcherLogoMode = "os";
  launcherLogoSizeOffset = 0;
  launcherPluginOrder = [ ];
  launcherPluginVisibility = { };
  launcherStyle = "full";
  launcherUseOverlayLayer = false;
  lockAtStartup = false;
  lockBeforeSuspend = false;
  lockDateFormat = "";
  lockScreenFontFamily = "";
  lockScreenInactiveColor = "#000000";
  lockScreenNotificationMode = 0;
  lockScreenPowerOffMonitorsOnLock = false;
  lockScreenShowDate = true;
  lockScreenShowMediaPlayer = true;
  lockScreenShowPasswordField = true;
  lockScreenShowPowerActions = true;
  lockScreenShowProfileImage = true;
  lockScreenShowSystemIcons = true;
  lockScreenShowTime = true;
  lockScreenVideoCycling = false;
  lockScreenVideoEnabled = false;
  lockScreenVideoPath = "";
  lockScreenWallpaperFillMode = "";
  lockScreenWallpaperPath = "";
  loginctlLockIntegration = true;
  m3ElevationColorMode = "default";
  m3ElevationCustomColor = "#000000";
  m3ElevationEnabled = true;
  m3ElevationIntensity = 12;
  m3ElevationLightDirection = "top";
  m3ElevationOpacity = 30;
  mangoLayoutBorderSize = -1;
  mangoLayoutGapsOutOverride = -1;
  mangoLayoutGapsOverride = -1;
  mangoLayoutRadiusOverride = -1;
  mangoTrackpadNaturalScrolling = true;
  matugenContrast = 0;
  matugenScheme = "scheme-tonal-spot";
  matugenTargetMonitor = "";
  matugenTemplateAlacritty = true;
  matugenTemplateDgop = true;
  matugenTemplateEmacs = true;
  matugenTemplateEquibop = true;
  matugenTemplateFirefox = true;
  matugenTemplateFoot = true;
  matugenTemplateGhostty = true;
  matugenTemplateGtk = true;
  matugenTemplateHyprland = true;
  matugenTemplateKcolorscheme = true;
  matugenTemplateKitty = true;
  matugenTemplateMangowc = true;
  matugenTemplateNeovim = false;
  matugenTemplateNeovimSetBackground = true;
  matugenTemplateNeovimSettings = {
    dark = {
      baseTheme = "github_dark";
      harmony = 0.5;
    };
    light = {
      baseTheme = "github_light";
      harmony = 0.5;
    };
  };
  matugenTemplateNiri = true;
  matugenTemplatePywalfox = true;
  matugenTemplateQt5ct = true;
  matugenTemplateQt6ct = true;
  matugenTemplateVencord = true;
  matugenTemplateVesktop = true;
  matugenTemplateVscode = true;
  matugenTemplateWezterm = true;
  matugenTemplateZed = true;
  matugenTemplateZenBrowser = true;
  maxFprintTries = 15;
  maxWorkspaceIcons = 3;
  mediaAdaptiveWidthEnabled = true;
  mediaExcludePlayers = [ ];
  mediaSize = 1;
  modalAnimationSpeed = 1;
  modalCustomAnimationDuration = 150;
  modalDarkenBackground = true;
  modalElevationEnabled = true;
  monoFontFamily = "Fira Code";
  motionEffect = 0;
  muteSoundsWhenMediaPlaying = true;
  muxCustomCommand = "";
  muxSessionFilter = "";
  muxType = "tmux";
  muxUseCustomCommand = false;
  networkPreference = "auto";
  nightModeEnabled = false;
  niriLayoutBorderSize = -1;
  niriLayoutGapsOverride = -1;
  niriLayoutRadiusOverride = -1;
  niriOutputSettings = { };
  niriOverviewOverlayEnabled = true;
  notepadAutoSave = false;
  notepadDefaultMode = "slideout";
  notepadEdgeGap = 0;
  notepadFontFamily = "";
  notepadFontSize = 14;
  notepadLastCustomTransparency = 0.7;
  notepadShowLineNumbers = false;
  notepadSlideoutSide = "right";
  notepadTransparencyOverride = -1;
  notepadUseCompositorGap = false;
  notepadUseMonospace = true;
  notificationAnimationSpeed = 1;
  notificationBodyFontSize = 0;
  notificationCompactMode = false;
  notificationCustomAnimationDuration = 400;
  notificationDedupeEnabled = true;
  notificationFocusedMonitor = false;
  notificationHistoryEnabled = true;
  notificationHistoryMaxAgeDays = 7;
  notificationHistoryMaxCount = 50;
  notificationHistorySaveCritical = true;
  notificationHistorySaveLow = true;
  notificationHistorySaveNormal = true;
  notificationOverlayEnabled = false;
  notificationPopupPosition = 0;
  notificationPopupPrivacyMode = false;
  notificationPopupShadowEnabled = true;
  notificationRules = [ ];
  notificationShowTimeoutBar = false;
  notificationSummaryFontSize = 0;
  notificationTimeoutCritical = 0;
  notificationTimeoutLow = 5000;
  notificationTimeoutNormal = 5000;
  osdAlwaysShowValue = false;
  osdAudioOutputEnabled = true;
  osdBrightnessEnabled = true;
  osdCapsLockEnabled = true;
  osdIdleInhibitorEnabled = true;
  osdMediaPlaybackEnabled = false;
  osdMediaVolumeEnabled = true;
  osdMicMuteEnabled = true;
  osdPosition = 5;
  osdPowerProfileEnabled = false;
  osdVolumeEnabled = true;
  padHours12Hour = false;
  popoutAnimationSpeed = 1;
  popoutCustomAnimationDuration = 150;
  popoutElevationEnabled = true;
  popupTransparency = 1;
  powerActionConfirm = true;
  powerActionHoldDuration = 0.5;
  powerMenuActions = [
    "reboot"
    "logout"
    "poweroff"
    "lock"
    "suspend"
    "restart"
  ];
  powerMenuDefaultAction = "logout";
  powerMenuGridLayout = false;
  privacyShowCameraIcon = false;
  privacyShowMicIcon = false;
  privacyShowScreenShareIcon = false;
  qtThemingEnabled = false;
  registryThemeVariants = { };
  rememberLastMode = true;
  rememberLastQuery = false;
  reverseScrolling = false;
  runDmsMatugenTemplates = true;
  runUserMatugenTemplates = true;
  runningAppsCompactMode = true;
  runningAppsCurrentMonitor = false;
  runningAppsCurrentWorkspace = true;
  runningAppsGroupByApp = false;
  screenPreferences = { };
  scrollTitleEnabled = true;
  selectedGpuIndex = 0;
  showBattery = true;
  showBatteryPercent = true;
  showBatteryPercentOnlyOnBattery = false;
  showBatteryTime = false;
  showBatteryTimeOnlyOnBattery = false;
  showCapsLockIndicator = true;
  showClipboard = true;
  showClock = true;
  showControlCenterButton = true;
  showCpuTemp = true;
  showCpuUsage = true;
  showDock = true;
  showFocusedWindow = true;
  showGpuTemp = true;
  showLauncherButton = true;
  showMemUsage = true;
  showMusic = true;
  showNotificationButton = true;
  showOccupiedWorkspacesOnly = false;
  showOnLastDisplay = { };
  showPrivacyButton = true;
  showSeconds = false;
  showSystemTray = true;
  showWeather = true;
  showWeekNumber = false;
  showWorkspaceApps = true;
  showWorkspaceIndex = false;
  showWorkspaceName = false;
  showWorkspacePadding = false;
  showWorkspaceSwitcher = true;
  sortAppsAlphabetically = false;
  soundLogin = false;
  soundNewNotification = true;
  soundPluggedIn = true;
  soundVolumeChanged = true;
  soundsEnabled = true;
  spotlightBarShowModeChips = false;
  spotlightCloseNiriOverview = true;
  spotlightModalViewMode = "list";
  spotlightSectionViewModes = { };
  syncComponentAnimationSpeeds = true;
  syncModeWithPortal = true;
  systemMonitorColorMode = "primary";
  systemMonitorCustomColor = {
    a = 1;
    b = 1;
    g = 1;
    hslHue = -1;
    hslLightness = 1;
    hslSaturation = 0;
    hsvHue = -1;
    hsvSaturation = 0;
    hsvValue = 1;
    r = 1;
    valid = true;
  };
  systemMonitorDisplayPreferences = [ "all" ];
  systemMonitorEnabled = false;
  systemMonitorGpuPciId = "";
  systemMonitorGraphInterval = 60;
  systemMonitorHeight = 480;
  systemMonitorLayoutMode = "auto";
  systemMonitorShowCpu = true;
  systemMonitorShowCpuGraph = true;
  systemMonitorShowCpuTemp = true;
  systemMonitorShowDisk = true;
  systemMonitorShowGpuTemp = false;
  systemMonitorShowHeader = true;
  systemMonitorShowMemory = true;
  systemMonitorShowMemoryGraph = true;
  systemMonitorShowNetwork = true;
  systemMonitorShowNetworkGraph = true;
  systemMonitorShowTopProcesses = false;
  systemMonitorTopProcessCount = 3;
  systemMonitorTopProcessSortBy = "cpu";
  systemMonitorTransparency = 0.8;
  systemMonitorVariants = [ ];
  systemMonitorWidth = 320;
  systemMonitorX = -1;
  systemMonitorY = -1;
  systemTrayIconTintMode = "none";
  systemTrayIconTintSaturation = 50;
  systemTrayIconTintStrength = 135;
  terminalsAlwaysDark = false;
  textRenderQuality = 0;
  textRenderType = 0;
  trayAutoOverflow = true;
  trayMaxVisibleItems = 0;
  trayPopupSingleLine = true;
  u2fMode = "or";
  updaterAllowAUR = true;
  updaterCheckOnStart = false;
  updaterCustomCommand = "";
  updaterHideWidget = false;
  updaterIncludeFlatpak = true;
  updaterIntervalSeconds = 1800;
  updaterTerminalAdditionalParams = "";
  updaterUseCustomCommand = false;
  use24HourClock = true;
  useAutoLocation = false;
  useFahrenheit = false;
  useSystemSoundTheme = false;
  wallpaperBackgroundColorMode = "black";
  wallpaperBackgroundCustomColor = "#000000";
  wallpaperFillMode = "Fill";
  waveProgressEnabled = true;
  weatherEnabled = true;
  widgetBackgroundColor = "sch";
  widgetBackgroundCustomColor = "#6750A4";
  widgetBackgroundCustomStrength = 0.5;
  widgetColorMode = "default";
  wifiNetworkPins = { };
  windSpeedUnit = "kmh";
  workspaceActiveAppHighlightEnabled = false;
  workspaceAppIconSizeOffset = 0;
  workspaceColorMode = "default";
  workspaceDragReorder = true;
  workspaceFocusedBorderColor = "primary";
  workspaceFocusedBorderCustomColor = "#6750A4";
  workspaceFocusedBorderEnabled = false;
  workspaceFocusedBorderThickness = 2;
  workspaceFocusedCustomColor = "#6750A4";
  workspaceFollowFocus = false;
  workspaceNameIcons = { };
  workspaceOccupiedColorMode = "none";
  workspaceOccupiedCustomColor = "#625B71";
  workspaceScrolling = false;
  workspaceUnfocusedColorMode = "default";
  workspaceUnfocusedCustomColor = "#49454E";
  workspaceUnfocusedMonitorBorderColor = "primary";
  workspaceUnfocusedMonitorBorderCustomColor = "#6750A4";
  workspaceUnfocusedMonitorBorderEnabled = false;
  workspaceUnfocusedMonitorBorderThickness = 2;
  workspaceUnfocusedMonitorColorMode = "default";
  workspaceUnfocusedMonitorFocusedCustomColor = "#6750A4";
  workspaceUnfocusedMonitorOccupiedColorMode = "none";
  workspaceUnfocusedMonitorOccupiedCustomColor = "#625B71";
  workspaceUnfocusedMonitorSeparateAppearance = false;
  workspaceUnfocusedMonitorUnfocusedColorMode = "default";
  workspaceUnfocusedMonitorUnfocusedCustomColor = "#49454E";
  workspaceUnfocusedMonitorUrgentColorMode = "default";
  workspaceUnfocusedMonitorUrgentCustomColor = "#B3261E";
  workspaceUrgentColorMode = "default";
  workspaceUrgentCustomColor = "#B3261E";
}
