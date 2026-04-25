{ config, pkgs, lib, ... }:

let
  corefonts = pkgs.corefonts;
  dirPath = ".local/share/fonts";

  fontPkgs = (import ./locale/fonts.nix { inherit pkgs; }).fonts.packages;
  fontDirs = lib.concatMapStringsSep " " (pkg:
    "${pkg}/share/fonts"
  ) fontPkgs;
in
{
  # unfree 放行 corefonts
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "corefonts" ];

  home.packages = [ pkgs.onlyoffice-desktopeditors corefonts ];

  # 拷贝 corefonts 到 fonts 中
  home.activation.linkCorefonts = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    FONT_DIR="$HOME/${dirPath}"
    mkdir -p "$FONT_DIR"

    cp -f ${corefonts}/share/fonts/truetype/* "$FONT_DIR/" 2>/dev/null || true
    chmod 644 "$FONT_DIR"/* 2>/dev/null || true
  '';

  # 拷贝 fonts.packages 到 fonts 中
  home.activation.syncFonts =
    lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      FONT_DIR="$HOME/.local/share/fonts"
      mkdir -p "$FONT_DIR"

      # 遍历所有 fonts.packages
      for dir in ${fontDirs}; do
        if [ -d "$dir" ]; then
          # 找所有字体文件
          find "$dir" -type f \( -iname "*.ttf" -o -iname "*.otf" -o -iname "*.ttc" \) | while read -r font; do
            base=$(basename "$font")
            target="$FONT_DIR/$base"

            # 增量复制：不存在才复制
            if [ ! -f "$target" ]; then
              cp "$font" "$target"
              chmod 644 "$target"
            fi
          done
        fi
      done
    '';
}
