return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- nix = { "nixfmt" },
        lua = { "stylua" },
        python = { "ruff_format" },
      },
    },
  },
}
