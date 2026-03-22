{ config, dotfiles, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ${dotfiles}#desktop";
    };

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

      [[ $TERM != "linux" ]] && eval "$(starship init zsh)"
    '';
  };

  xdg.enable = true;

  programs.zoxide.enable = true;
  programs.fzf.enable = true;
}
