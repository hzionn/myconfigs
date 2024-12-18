-- This is a Lua plugin configuration file for the 'yetone/avante.nvim' plugin.
-- It includes settings for the plugin, dependencies, and optional configurations.

return {
  "yetone/avante.nvim",
  event = "VeryLazy", -- Load the plugin lazily
  build = "make", -- Build command for the plugin
  opts = {
    -- add any opts here
    provider = "copilot", -- Set the provider to 'openai', 'copilot', 'claude'
    hints = { enable = true }, -- Enable hints
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below is optional, make sure to setup it properly if you have lazy=true
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" }, -- File types for the optional plugin
      },
      ft = { "markdown", "Avante" }, -- File types for the optional plugin
    },
  },
}
