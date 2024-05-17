return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua", -- Lua
      "shfmt", -- Shell
      "black", -- Python
      "jedi-language-server", -- Python
      "clangd", -- C/C++
      "r-languageserver", -- R
      "biome", -- fast alternative to prettier
    },
  },
}

