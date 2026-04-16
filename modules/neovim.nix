{ config, pkgs, ... }:

{
  programs.neovim.enable = true;
  home.file.".config/nvim".source = ../nvim;

  home.packages = with pkgs; [
    # 文件搜索
    fd
    # 剪贴板交互 
    xclip
    # C Compiler
    gcc
    gnumake
    tree-sitter
  ];
}
