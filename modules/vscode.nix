{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vscode
  ];

  home.file.".config/Code/User/settings.json".text = ''
    {
      "editor.fontFamily": "Source Code Pro"
    }
  '';
}
