{

  programs.plasma.window-rules = [
    {
      description = "Brave on desktop 1";
      match = {
        window-class = "brave-browser";
        window-types = [ "normal" ];
      };
      apply = {
        desktops = {
          value = "Desktop_1";
          apply = "force";
        };
        maximizehoriz = {
          value = true;
          apply = "force";
        };
        maximizevert = {
          value = true;
          apply = "force";
        };
      };
    }

    {
      description = "Ghostty on desktop 2";
      match = {
        window-class = "com.mitchellh.ghostty";
        window-types = [ "normal" ];
      };
      apply = {
        desktops = {
          value = "Desktop_2";
          apply = "force";
        };
        maximizehoriz = {
          value = true;
          apply = "force";
        };
        maximizevert = {
          value = true;
          apply = "force";
        };
      };
    }

    {
      description = "Code on desktop 3";
      match = {
        window-class = "Code";
        window-types = [ "normal" ];
      };
      apply = {
        desktops = {
          value = "Desktop_3";
          apply = "force";
        };
        maximizehoriz = {
          value = true;
          apply = "force";
        };
        maximizevert = {
          value = true;
          apply = "force";
        };
      };
    }

    {
      description = "Steam on desktop 4";
      match = {
        window-class = {
          value = "steam";
          type = "substring";
        };
        window-types = [ "normal" ];
      };
      apply = {
        desktops = {
          value = "Desktop_4";
          apply = "force";
        };
        maximizehoriz = {
          value = true;
          apply = "force";
        };
        maximizevert = {
          value = true;
          apply = "force";
        };
      };
    }

    {
      description = "Spotify on desktop 5";
      match = {
        window-class = "spotify";
        window-types = [ "normal" ];
      };
      apply = {
        desktops = {
          value = "Desktop_5";
          apply = "force";
        };
        maximizehoriz = {
          value = true;
          apply = "force";
        };
        maximizevert = {
          value = true;
          apply = "force";
        };
      };
    }
  ];
}
