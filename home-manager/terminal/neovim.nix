{
  pkgs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    # defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    plugins = with pkgs.vimPlugins; [
      # Appearance
      catppuccin-nvim
      # lualine-nvim
      # indent-blankline-nvim
      nvim-web-devicons
      # bufferline-nvim
      gitsigns-nvim

      # Navigation
      # nvim-tree-lua
      # telescope-nvim
      # telescope-fzf-native-nvim

      # LSP & Completion
      nvim-lspconfig
      nvim-cmp
      # cmp-nvim-lsp
      # cmp-path
      # cmp-buffer
      # luasnip
      # cmp_luasnip
      # lspkind-nvim

      # Utilities
      nvim-autopairs
      # nvim-comment
      # which-key-nvim
      # toggleterm-nvim
      # alpha-nvim
    ];
  };
}
