-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- use :echo &ft to show filetype
-- use different indentation for different filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "c",
    "html",
  },
  command = "setlocal shiftwidth=2 tabstop=2",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "python",
    "rust",
    "javascript",
    "typescript",
  },
  command = "setlocal shiftwidth=4 tabstop=4",
})

