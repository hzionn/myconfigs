return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            jump = { close = true },

            -- IMPORTANT: configure layout here (not `type = "float"`)
            layout = {
              preset = "vertical", -- "telescope" centered floating layout preset
              preview = false,
              layout = { -- override layout dimensions/border
                width = 0.4,
                height = 0.8,
                border = "rounded",
              },
            },
            tree = false, -- disables the nested tree view (often fixes weird nesting)
            dirs_first = true, -- folders before files
            sort = { "name" }, -- stable ordering
          },
          files = {
            hidden = true,
          },
        },
      },
    },
  },
}
