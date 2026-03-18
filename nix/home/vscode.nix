{ pkgs, lib, ... }:

let
  vscodeDir = "$HOME/.config/Code/User";
  dotfiles = "$HOME/Repos/dotfiles";
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
  };

  home.activation.vscodeConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "${vscodeDir}"
    mkdir -p "$HOME/.vscode"

    cp ${../../vscode/argv-linux.json} "$HOME/.vscode/argv.json"
    chmod 644 "$HOME/.vscode/argv.json"

    ln -sf "${dotfiles}/vscode/settings.json" "${vscodeDir}/settings.json"
    ln -sf "${dotfiles}/vscode/keybindings-linux.json" "${vscodeDir}/keybindings.json"
  '';
}

