{ config, pkgs, ... }:

{
  programs.neovim.enable = true;
  home.file.".config/nvim".source = ../nvim;

  home.packages = with pkgs; [
    # 文件搜索
    fd
    # C Compiler
    gcc
    gnumake
    tree-sitter
    # nix
    nixd
    # lua
    lua-language-server
    stylua
    # python
    pyright
    ruff
  ];
}
