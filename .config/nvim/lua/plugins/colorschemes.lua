return {
  -- install and configure colorscheme here
  {
    "Mofiqul/vscode.nvim",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        -- disable_blackground = true,
        -- disable_float_background = true,
        styles = {
          transparency = true,
        },
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "sainnhe/sonokai",
    priority = 1000,
    config = function()
      vim.g.sonokai_disable_terminal_colors = "1"
      vim.g.sonokai_transparent_background = 2
      vim.g.sonokai_enable_italic = "1"
      vim.g.sonokai_style = "andromeda"
      vim.g.sonokai_better_performance = 1
    end,
  },

  -- Configure LazyVim to load which colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
      -- colorscheme = "retrobox",
      -- colorscheme = "sonokai",
      -- colorscheme = "catppuccin-frappe",
    },
  },
}
