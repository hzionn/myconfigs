return {
  -- install and configure colorscheme here
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "Mofiqul/vscode.nvim",
    opts = {
      transparent = true,
      disable_nvimtree_bg = true,
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      dim_inactive = false,
      transparent_mode = true,
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
