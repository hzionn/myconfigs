return {
  "williamboman/mason.nvim",

  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "stevearc/conform.nvim",
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    local conform = require("conform")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "html",
        "lua_ls",
        "pyright",
        "ts_ls",
        "gopls",
        "sqlls",
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- formatter
        "prettier",
        "stylua",
        "isort",
        "ruff",
        "black",
        "sql-formatter",
        -- linter
        "eslint_d",
      },
      automatic_installation = true,
    })

    -- here to set the formatters
    conform.setup({
      formatters_by_ft = {
        python = { "black", "ruff", "isort" },
        go = { "gofmt" },
        sql = { "sql_formatter" },
        html = { "prettier" },
      },
    })
  end,
}
