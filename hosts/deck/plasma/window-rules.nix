{
  programs.plasma.window-rules = [
    {
      description = "Brave on desktop 1";
      match.window-class = "brave-browser";
      apply.desktops = {
        value = "Desktop_1";
        apply = "initially";
      };
    }

    {
      description = "Ghostty on desktop 2";
      match.window-class = "com.mitchellh.ghostty";
      apply.desktops = {
        value = "Desktop_2";
        apply = "initially";
      };
    }

    {
      description = "Code on desktop 3";
      match.window-class = "Code";
      apply.desktops = {
        value = "Desktop_3";
        apply = "initially";
      };
    }

    {
      description = "Steam on desktop 4";
      match.window-class = {
        value = "steam";
        type = "substring";
      };
      apply.desktops = {
        value = "Desktop_4";
        apply = "initially";
      };
    }

    {
      description = "Spotify on desktop 5";
      match.window-class = "spotify";
      apply.desktops = {
        value = "Desktop_5";
        apply = "initially";
      };
    }
  ];
}
