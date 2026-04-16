{ config, lib, ... }:

let
  cfg = config.boot.loader.limineExt;
in
{
  options.boot.loader.limineExt = {
    windowsUuid = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Windows EFI partition UUID";
    };
  };

  config = {
    boot.loader = {
      efi.canTouchEfiVariables = true;
      limine = {
        enable = true;
        secureBoot.enable = true;
        maxGenerations = 5;

        extraConfig = ''
          remember_last_entry: yes
        '';

        extraEntries = ''
          /Windows
              protocol: efi
              path: uuid(${cfg.windowsUuid}):/EFI/Microsoft/Boot/bootmgfw.efi
        '';
      };
    };
  };
}
