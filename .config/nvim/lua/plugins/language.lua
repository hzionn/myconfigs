return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright = {},
        ruff_lsp = {},
        tsserver = {},
        gopls = {},
        sqlls = {},
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black", "ruff", "isort" },
        go = { "gofmt" },
        sql = { "sql_formatter" },
        html = { "prettier" },
        markdown = { "prettier" },
      },
    },
  },
}
