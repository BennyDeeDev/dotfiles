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
       source ${../../../../files/bash/aliases}
       source ${../../../../files/bash/envs}
       source ${../../../../files/bash/functions}
       source ${../../../../files/bash/keybindings}

      [[ $TERM != "linux" ]] && eval "$(starship init zsh)"
    '';
  };

  xdg.enable = true;

  programs.zoxide.enable = true;
  programs.fzf.enable = true;
}
