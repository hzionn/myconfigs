return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier, -- For Prettier
        null_ls.builtins.formatting.black, -- For Black
        null_ls.builtins.formatting.stylua, -- For Stylua
        null_ls.builtins.formatting.sql_formatter, -- For SQL
      },
    })
  end,
}
