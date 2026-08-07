{
  homebrew = {
    enable = true;
    taps = [
      {
        name = "TheBoredTeam/boring-notch";
        trusted = true;
      }
    ];
    casks = [
      "boring-notch"
      "ghostty"
      "stats"
    ];
    onActivation.cleanup = "uninstall";
  };
}
