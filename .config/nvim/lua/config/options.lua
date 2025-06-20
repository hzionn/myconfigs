-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 0
vim.g.laststatus = 3
vim.opt.background = "dark"
vim.g.autoformat = false
vim.g.spell = false

-- set to 1, the nvim will auto close current preview window when changing
-- from Markdown buffer to another buffer
-- 0 for not auto close
vim.g.mkdp_auto_close = 0

vim.g.termguicolors = true
-- vim.opt.guifont = "JetBrains Mono:h20"
