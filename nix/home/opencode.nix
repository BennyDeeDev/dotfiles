{ pkgs, ... }:

{
  home.packages = [ pkgs.opencode ];

  home.sessionVariables = {
    OPENCODE_MODEL_CHEAP = "opencode-go/deepseek-v4-flash";
    OPENCODE_MODEL_MID = "opencode-go/minimax-m3";
    OPENCODE_MODEL_STRONG = "opencode-go/glm-5.2";
  };

  xdg.configFile."opencode/opencode.json".source = ../../opencode/opencode.json;
  xdg.configFile."opencode/AGENTS.md".source = ../../opencode/AGENTS.md;
  xdg.configFile."opencode/agents".source = ../../opencode/agents;
}