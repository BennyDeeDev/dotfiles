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
      # TODO: consider using withPlugins
      nvim-treesitter.withAllGrammars
    ];
  };

  home.packages = with pkgs; [
    nixd
    nixfmt
    lua-language-server
    stylua
    zls
  ];

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim";
}
