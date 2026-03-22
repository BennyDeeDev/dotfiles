{
  pkgs,
  lib,
  config,
  dotfiles,
  ...
}:

{
  home.packages = [ pkgs.nixfmt ];

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    package = pkgs.vscode;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      github.copilot-chat
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      vadimcn.vscode-lldb
      jnoortheen.nix-ide
      ziglang.vscode-zig
    ];
  };

  xdg.configFile = {
    "Code/User/settings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/vscode/settings.json";
    "Code/User/keybindings.json".source =
      config.lib.file.mkOutOfStoreSymlink "${dotfiles}/vscode/keybindings-linux.json";
  };

  home.activation.vscodeConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p "$HOME/.vscode"
    cp ${../../vscode/argv-linux.json} "$HOME/.vscode/argv.json"
    chmod 644 "$HOME/.vscode/argv.json"
  '';
}
