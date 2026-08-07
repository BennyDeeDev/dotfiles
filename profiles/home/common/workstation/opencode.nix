{ pkgs, ... }:

{
  home.packages = [ pkgs.opencode ];

  home.sessionVariables = {
    OPENCODE_MODEL = "opencode-go/gpt-5.6-luna";
  };

  xdg.configFile."opencode/opencode.json".source = ../../../../files/opencode/opencode.json;
  xdg.configFile."opencode/AGENTS.md".source = ../../../../files/opencode/AGENTS.md;
  xdg.configFile."opencode/agents".source = ../../../../files/opencode/agents;
}
