{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gh
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "jkjkil4";
      user.email = "1173374788@qq.com";
      init.defaultBranch = "main";
      core.quotepath = false;
    };
  };
}
