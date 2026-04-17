return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nixd = {},
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
            },
          },
        },
        pyright = {},
        -- ruff = {
        --   cmd = { "ruff", "server" },
        -- },
      },
    },
  },
}
