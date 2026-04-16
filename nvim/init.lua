-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- compatibility to extraConfig
vim.cmd('source ~/.config/nvim/extraConfig.vim')
