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
      roslyn-nvim
      nvim-autopairs

      (nvim-treesitter.withPlugins (p: [ p.lua p.nix p.zig p.json p.toml p.yaml p.markdown p.markdown_inline p.bash p.just p.gdscript p.c_sharp ]))
    ];
  };

  home.packages = with pkgs; [
    # LSP
    nixd
    lua-language-server
    zls
    roslyn-ls

    # Formatters
    nixfmt
    stylua
    taplo
    shfmt
    just
    gdtoolkit_4
    csharpier

    # fzf-lua
    fd
    ripgrep
    bat
    delta
  ];

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim";
}
