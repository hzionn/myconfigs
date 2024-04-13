return {
  "folke/which-key.nvim",
  opts = function(_, opts)
    if require("lazyvim.util").has("noice.nvim") then
      opts.defaults["<leader>sn"] = { name = "+noice" }
    end

    opts.defaults["<leader>fs"] = { "<cmd>Neotree git_status<cr>", "git_status" }
  end,
}
