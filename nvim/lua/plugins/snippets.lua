vim.api.nvim_create_autocmd("DirChanged", {
  callback = function()
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { vim.fn.getcwd() .. "/.vscode/snippets" },
    })
    require("luasnip.loaders.from_vscode").load_standalone({
      path = vim.fn.getcwd() .. "/.code-snippets",
    })
  end,
})

vim.filetype.add({
  extension = {
    ["code-snippets"] = "jsonc",
  },
})

return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").load({
          paths = {
            vim.fn.stdpath("config") .. "/snippets",
          },
        })
      end,
    },
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      snippets = {
        preset = "luasnip",
      },
    },
  },
}
