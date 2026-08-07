{ pkgs, ... }:

{
  home.packages = [ pkgs.opencode ];

  home.sessionVariables = {
    OPENCODE_MODEL = "opencode-go/gpt-5.6-luna";
  };

  xdg.configFile."opencode/opencode.json".source = ../../opencode/opencode.json;
  xdg.configFile."opencode/AGENTS.md".source = ../../opencode/AGENTS.md;
  xdg.configFile."opencode/agents".source = ../../opencode/agents;
}
