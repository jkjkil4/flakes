{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.qq
    (pkgs.callPackage ./wechat.nix { })
  ];
}
