return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      servers = {
        pyright = {},
        ruff = {},
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
        "pyright",
        "ruff",
        "typescript-language-server",
        "gopls",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
    { "williamboman/mason-lspconfig.nvim", config = function() end },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "ruff", "isort" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        go = { "gofmt" },
        sql = { "sql_formatter" },
        html = { "prettier" },
        markdown = { "prettier" },
        c = { "clang-format" },
      },
    },
  },
}
