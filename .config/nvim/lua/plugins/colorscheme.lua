return {
  -- install and configure colorscheme here
  {
    "folke/tokyonight.nvim",
    name="tokyonight",
    opts = {
      -- transparent = true,
      styles = {
        -- sidebars = "transparent",
        -- floats = "transparent",
      },
    },
  },
  {
    "Mofiqul/vscode.nvim",
    opts = {
      -- transparent = true,
      disable_nvimtree_bg = true,
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      dim_inactive = false,
      -- transparent_mode = true,
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        -- transparency = true,
      },
    },
  },
  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup({
        background = "hard",
        -- transparent_background_level = 2,
        italics = true,
      })
    end,
  },

  -- Configure LazyVim to load which colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
      -- colorscheme = "tokyonight-moon",
      -- colorscheme = "vscode",
      -- colorscheme = "gruvbox",
      -- colorscheme = "everforest",
      -- colorscheme = "tokyonight",
    },
  },
}
