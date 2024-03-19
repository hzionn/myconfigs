return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- show all files, all "hide" just mean "dimmed out"
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_by_name = {
          "LICENSE",
          "__pycache__/",
          ".vscode/",
        },
        hide_by_pattern = {
          "*.csv",
          "*.Rproj",
        },
      },
    },
    window = {
      width = 30,
    },
  },
}
