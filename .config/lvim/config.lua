-- this is for OVERWRITE the default lunarvim configurations

-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Settings
lvim.colorscheme = "carbonfox"
lvim.builtin.which_key.mappings["t"] = {
    name = "+Terminal",
    f = { "<cmd>ToggleTerm<cr>", "Floating terminal" },
    v = { "<cmd>2ToggleTerm size=60 direction=vertical<cr>", "Split vertical" },
    h = { "<cmd>2ToggleTerm size=10 direction=horizontal<cr>", "Split horizontal" },
}

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
    -- others
    -- {
    --   "stevearc/dressing.nvim",
    --   config = function()
    --     require("dressing").setup({
    --       input = { enabled = false },
    --     })
    --   end,
    -- },
    -- {
    --   "nvim-neorg/neorg",
    --   ft = "norg", -- lazy-load on filetype
    --   config = true, -- run require("neorg").setup()
    -- },
}

-- Vim Options
vim.opt.showmode = true -- this will show current vim mode
vim.opt.wrap = true
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.scrolloff = 15

