return {
  {
    "chomosuke/typst-preview.nvim",
    lazy = false,
    opts = {
      dependencies_bin = {
        tinymist = "tinymist",
      },
    },
    keys = {
      { "<leader>tp", ft = "typst", "<cmd>TypstPreviewToggle<cr>", desc = "Typst Preview Toggle" },
      { "<leader>to", ft = "typst", "<cmd>TypstPreview<cr>", desc = "Typst Preview Open" },
      { "<leader>ts", ft = "typst", "<cmd>TypstPreviewStop<cr>", desc = "Typst Preview Stop" },
    },
  },
}
