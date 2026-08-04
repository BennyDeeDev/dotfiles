{
  homebrew = {
    enable = true;
    taps = [
      {
        name = "TheBoredTeam/boring-notch";
        trusted = true;
      }
    ];
    casks = [ "boring-notch" ];
    onActivation.cleanup = "none";
  };
}
