{
  homeManager =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      programs.vscode = {
        enable = true;
        mutableExtensionsDir = false;
        package = pkgs.vscode;
        profiles.default = {
          userSettings = config.lib.file.mkOutOfStoreSymlink ../../files/vscode/settings.json;
          userMcp = config.lib.file.mkOutOfStoreSymlink ../../files/vscode/mcp.json;
          keybindings = lib.mkIf pkgs.stdenv.hostPlatform.isLinux (
            config.lib.file.mkOutOfStoreSymlink ../../files/vscode/keybindings-linux.json
          );
          extensions = with pkgs.vscode-extensions; [
            github.copilot-chat
            catppuccin.catppuccin-vsc
            catppuccin.catppuccin-vsc-icons
            esbenp.prettier-vscode
            jnoortheen.nix-ide
            dbaeumer.vscode-eslint
            golang.go
            mikestead.dotenv
          ];
        };
      };
    };
}
