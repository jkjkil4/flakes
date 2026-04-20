return {
  "CRAG666/code_runner.nvim",
  keys = {
    {
      "<leader>r",
      ":w<CR>:RunCode<CR>",
      desc = "Run Code",
    },
  },
  opts = {
    filetype = {
      cpp = {
        "cd $dir &&",
        "mkdir -p build &&",
        "g++ $dir/$fileName -o $dir/build/$fileNameWithoutExt -std=c++17 &&",
        "$dir/build/$fileNameWithoutExt",
      },
      typst = {
        "tinymist compile $dir/$fileName && firefox $dir/$fileNameWithoutExt.pdf",
      },
    },
  },
}
