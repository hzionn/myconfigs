-- Check if running inside VSCode
local is_vscode = vim.fn.exists('g:vscode') == 1 or vim.env.VSCODE_PID ~= nil

if is_vscode then
  vim.o.laststatus = 0  -- hide statusline in vscode
end

return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      enabled = not is_vscode,
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      enabled = not is_vscode,
    },
  },
  {
    "yetone/avante.nvim",
    opts = {
      enabled = not is_vscode,
    },
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      enabled = not is_vscode,
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      enabled = not is_vscode,
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      enabled = not is_vscode,
      -- ... other LSP config options
      on_attach = function(client)
        if is_vscode then
          -- Disable clear_references
          client.server_capabilities.documentFormatting = nil
        end
        -- ... other on_attach logic
      end,
    },
  }
}
