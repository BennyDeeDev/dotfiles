{ pkgs, lib, config, dotfiles, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
  };

  home.file = {
    ".config/Code/User/settings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/vscode/settings.json";
    ".config/Code/User/keybindings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/vscode/keybindings-linux.json";
  };

  home.activation.vscodeConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.vscode"
    cp ${../../vscode/argv-linux.json} "$HOME/.vscode/argv.json"
    chmod 644 "$HOME/.vscode/argv.json"
  '';
}

