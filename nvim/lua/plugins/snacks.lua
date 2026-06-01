return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        projects = {
          dev = { "~/Projects" },
          patterns = { ".git" },
          max_depth = 3,
        },
      },
    },
  },
}
