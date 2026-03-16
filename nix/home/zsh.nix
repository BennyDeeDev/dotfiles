{ config, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    autocd = true;

    history = {
      size = 50000;
      save = 50000;
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
    };

    initContent = ''
      source ${../../bash/aliases}
      source ${../../bash/envs}
      source ${../../bash/functions}
      source ${../../bash/keybindings}
    '';
  };

  xdg.enable = true;

  programs.zoxide.enable = true;
  programs.fzf.enable = true;
}
