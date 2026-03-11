return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      servers = {
        pyrefly = {
          init_options = {
            displayTypeErrors = "force-on",
          },
        },
        ruff = {},
        tsserver = {},
        gopls = {},
        sqlls = {},
        rust_analyzer = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      ensure_installed = {
        "pyrefly",
        "ruff",
        "typescript-language-server",
        "gopls",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
    { "mason-org/mason-lspconfig.nvim", config = function() end },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = { "prettier_astro" },
        rust = { "ast_grep" },
        lua = { "stylua" },
        python = { "isort", "ruff_format" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        go = { "gofmt" },
        sql = { "sql_formatter" },
        html = { "prettier" },
        markdown = { "prettier" },
        -- markdown = { "markdownlint-cli2" },
        c = { "clang-format" },
        yaml = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        toml = { "tombi" },
      },
      formatters = {
        prettier_astro = {
          command = "prettier",
          args = { "--plugin", "prettier-plugin-astro", "--stdin-filepath", "$FILENAME" },
          stdin = true,
        },
      },
    },
  },
}
