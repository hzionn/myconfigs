return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    if require("lazyvim.util").has("noice.nvim") then
      opts.defaults["<leader>sn"] = { name = "+noice" }
    end
    -- define open terminal (split and vsplit)
    opts.defaults["<leader>t"] = { name = "+terminal" }
    opts.defaults["<leader>to"] = { "<Cmd>split term://$SHELL<CR>", "Split Terminal" }
    opts.defaults["<leader>tv"] = { "<Cmd>vsplit term://$SHELL<CR>", "VSplit Terminal" }
  end,
}
