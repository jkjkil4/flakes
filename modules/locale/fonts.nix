{ config, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      adwaita-fonts
      noto-fonts-color-emoji
      nerd-fonts.symbols-only
      # 以上三个几乎是必须安装的
      noto-fonts-cjk-sans-static
      noto-fonts-cjk-serif-static
      # sarasa-gothic  #更纱黑体（字体比较大
      # 下面是一些常见的编程字体随便选
      source-code-pro
      # hack-font
      # jetbrains-mono
      # maple-mono.variable
    ];

    # 简单配置一下 fontconfig 字体顺序，以免 fallback 到不想要的字体
    # 比如日文港台异体字
    fontconfig = {
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "Noto Sans Mono CJK SC"
          "Sarasa Mono SC"
          "DejaVu Sans Mono"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Source Han Sans SC"
          "DejaVu Sans"
        ];
        serif = [
          "Noto Serif CJK SC"
          "Source Han Serif SC"
          "DejaVu Serif"
        ];
      };
    };
  };
}
