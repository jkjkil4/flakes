{ config, pkgs, ... }:

let
  fonts = [
    {
      weight = "Thin";
      hash = "sha256-Yqo6R02aJfImh8xkB1KH5po1b6g0ZddKKJjSsgRKjCU=";
    }
    {
      weight = "DemiLight";
      hash = "sha256-8+A128tp2CjWth+epC+H82GXclLsOYuK+u1IS1ByNHI=";
    }
    {
      weight = "Light";
      hash = "sha256-j2TkjUgESe2CwSXXnWc5QMEK/dDXLJ12CC7hkTuYEb0=";
    }
    {
      weight = "Regular";
      hash = "sha256-fbPGNLvQMBswgqgP/KwvQi6O+c4HMPiyecPo91ZZj2g=";
    }
    {
      weight = "Medium";
      hash = "sha256-JQM0OM+kHxhz1JArhVWVZVe3ZRF3VrzvlkBuAj5JV4w=";
    }
    {
      weight = "Bold";
      hash = "sha256-nncp75k8pMZHiC95hkT0u/baab2CLqxZP8aHF91sjio=";
    }
    {
      weight = "Black";
      hash = "sha256-1u8liJLe8Bz2YQDmICCH5DLEq/eN62Nr/B4wnSSC+dI=";
    }
  ];

  mkFont = f:
    pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/Apollys/chinese-fonts/master/fonts/Noto_Sans_S_Chinese_${f.weight}.otf";
      hash = f.hash;
    };

  srcs = map mkFont fonts;

  noto-sc = pkgs.stdenvNoCC.mkDerivation {
    name = "noto-sans-sc-all-weights";

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/share/fonts/opentype
    '' + pkgs.lib.concatMapStrings (f:
      "cp ${f} $out/share/fonts/opentype/\n"
    ) srcs;
  };

in
{
  fonts.packages = [ noto-sc ];
}
