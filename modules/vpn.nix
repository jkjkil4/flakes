{ config, lib, pkgs, ... }:

let
  cfg = config.programs.vpn;
in
{
  options.programs.vpn = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };

    software = lib.mkOption {
      type = lib.types.package;
    };

    port = lib.mkOption {
      type = lib.types.str;
    };

    users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "Users to apply git proxy";
    };
  };

  config = lib.mkIf cfg.enable {
    # --- system ---
    environment.systemPackages = [ cfg.software ];

    networking.proxy = {
      default = "http://127.0.0.1:${cfg.port}";
      noProxy = "127.0.0.1,localhost,internal.domain";
    };

    # --- home ---
    home-manager.users =
      lib.genAttrs cfg.users (user: {
        programs.git.settings = {
          http.proxy  = "http://127.0.0.1:${cfg.port}";
          https.proxy = "http://127.0.0.1:${cfg.port}";
        };
      });
  };
}
