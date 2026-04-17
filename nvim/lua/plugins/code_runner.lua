return {
  "CRAG666/code_runner.nvim",
  keys = {
    {
      "<leader>r",
      ":RunCode<CR>",
      desc = "Run Code",
    },
  },
  opts = {
    filetype = {
      cpp = {
        "cd $dir &&",
        "mkdir -p temp &&",
        'g++ $dir/$fileName -o $dir/temp/$fileNameWithoutExt -std=c++17 &&',
        "$dir/temp/$fileNameWithoutExt",
      },
    },
  },
}
