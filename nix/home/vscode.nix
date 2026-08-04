{
  pkgs,
  lib,
  config,
  dotfiles,
  ...
}:

{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    package = pkgs.vscode;
    profiles.default.extensions =
      with pkgs.vscode-extensions;
      [
        github.copilot-chat
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        jnoortheen.nix-ide
      ]
      ++ [
        (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
          mktplcRef = {
            publisher = "ltmoerdani";
            name = "opencode-copilot-chat";
            version = "0.2.8";
            sha256 = "sha256-Z9qmenRfJsSEPpyKQ8YAcLD46kdQjBFfhw2K1d1ny2M=";
          };
        })
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
