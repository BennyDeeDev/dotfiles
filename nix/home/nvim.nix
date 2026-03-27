{
  config,
  pkgs,
  dotfiles,
  ...
}:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      catppuccin-nvim
      no-neck-pain-nvim
      fzf-lua
      gitsigns-nvim
      conform-nvim
      blink-cmp
      toggleterm-nvim

      (nvim-treesitter.withPlugins (p: [ p.lua p.nix p.zig p.json p.toml p.yaml p.markdown p.markdown_inline p.bash ]))
    ];
  };

  home.packages = with pkgs; [
    nixd
    nixfmt
    lua-language-server
    stylua
    zls
    taplo
    shfmt
  ];

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim";
}
