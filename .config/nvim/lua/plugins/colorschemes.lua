return {
  -- install and configure colorscheme here
  {
    "Mofiqul/vscode.nvim",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "shaunsingh/nord.nvim",
  },

  -- Configure LazyVim to load which colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
