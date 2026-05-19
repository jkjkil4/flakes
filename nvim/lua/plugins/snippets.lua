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
        require("luasnip.loaders.from_vscode").lazy_load() -- load friendly-snippets
        require("luasnip.loaders.from_vscode").lazy_load({ -- load workspace snippets
          paths = {
            vim.fn.stdpath("config") .. "/snippets",
          },
        })
      end,
    },
    opts = function()
      LazyVim.cmp.actions.snippet_forward = function()
        if require("luasnip").jumpable(1) then
          vim.schedule(function()
            require("luasnip").jump(1)
          end)
          return true
        end
      end
      LazyVim.cmp.actions.snippet_stop = function()
        if require("luasnip").expand_or_jumpable() then -- or just jumpable(1) is fine?
          require("luasnip").unlink_current()
          return true
        end
      end
    end,
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
