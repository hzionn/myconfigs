-- this is for OVERWRITE the default lunarvim configurations

-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Plugins
lvim.plugins = {
    -- colorschemes
    { "lunarvim/colorschemes" },
    { "Mofiqul/vscode.nvim" },
    { "sainnhe/gruvbox-material" },
    { "sainnhe/everforest" },
    { "sainnhe/edge" },
    { "rebelot/kanagawa.nvim" },
    { "EdenEast/nightfox.nvim" },
    { "daschw/leaf.nvim" },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { "folke/tokyonight.nvim", priority = 1000 }
}

-- Vim Options
vim.opt.showmode = true -- this will show current vim mode
vim.opt.wrap = true
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert n spaces for a tab
vim.opt.scrolloff = 15
vim.opt.relativenumber = true
vim.opt.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.colorcolumn = "120"

-- set number of space for different language
vim.cmd[[
    autocmd BufEnter *.js setlocal tabstop=2 shiftwidth=2 expandtab
    autocmd BufEnter *.c setlocal tabstop=2 shiftwidth=2 expandtab
]]


-- Settings
lvim.colorscheme = "everforest" -- edge, aurora, everforest, gruvbox-material
lvim.transparent_window = true

-- value between 0-100 0 for fully opaque and 100 for fully transparent
lvim.builtin.which_key.setup.window.winblend = 10
lvim.builtin.which_key.mappings["t"] = {
    name = "+Terminal",
    f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
    v = { "<cmd>2ToggleTerm size=40 direction=vertical<cr>", "Split vertical" },
    h = { "<cmd>2ToggleTerm size=10 direction=horizontal<cr>", "Split horizontal" },
}

-- formatters settings
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
    { name = "isort" },
    {
        name = "black",
        filetypes = { "python" }
    },
}

-- ASCII text art generator
-- https://textkool.com/en/ascii-art-generator?hl=default&vl=default&font=ANSI%20Shadow&text=%20happy%0Acoding
lvim.builtin.alpha.dashboard.section.header.val = {
    "    ██╗  ██╗ █████╗ ██████╗ ██████╗ ██╗   ██╗  ",
    "    ██║  ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝  ",
    "    ███████║███████║██████╔╝██████╔╝ ╚████╔╝   ",
    "    ██╔══██║██╔══██║██╔═══╝ ██╔═══╝   ╚██╔╝    ",
    "    ██║  ██║██║  ██║██║     ██║        ██║     ",
    "    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝        ╚═╝     ",
    "                                               ",
    " ██████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ",
    "██╔════╝██╔═══██╗██╔══██╗██║████╗  ██║██╔════╝ ",
    "██║     ██║   ██║██║  ██║██║██╔██╗ ██║██║  ███╗",
    "██║     ██║   ██║██║  ██║██║██║╚██╗██║██║   ██║",
    "╚██████╗╚██████╔╝██████╔╝██║██║ ╚████║╚██████╔╝",
    " ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ",
}

