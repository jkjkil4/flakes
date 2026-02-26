{ config, pkgs, ... }:

{
  i18n.inputMethod = {
    enable = true;

    # 如果用 fcitx5
    # type = "fcitx5";
    # fcitx5.addons = with pkgs; [
    #   fcitx5-chinese-addons
    # ];

    # 我现在用 ibus
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin
    ];
  };
}
