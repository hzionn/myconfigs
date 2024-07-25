return {
  -- install and configure colorscheme here
  {
    "folke/tokyonight.nvim",
  },
  {
    "Mofiqul/vscode.nvim",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        transparency = true,
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
