{ config, pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      libfprint = prev.libfprint.overrideAttrs (old: {
        src = prev.fetchFromGitLab {
          domain = "gitlab.freedesktop.org";
          owner = "depau";
          repo = "libfprint";
          rev = "3cd94299";
          hash = "sha256-KIH0hJDAGhIhYRzNLiWPHJm2a/1vCaBlF5qEZc7YXB8=";
        };

        nativeBuildInputs = (old.nativeBuildInputs or []) ++ [
          prev.pkg-config
        ];
        buildInputs = (old.buildInputs or []) ++ [
          prev.nss
        ];
      });
      fprintd = prev.fprintd.overrideAttrs (_: {
        version = "1.94.4";
        src = prev.fetchFromGitLab {
          domain = "gitlab.freedesktop.org";
          owner = "libfprint";
          repo = "fprintd";
          rev = "refs/tags/v1.94.4";
          hash = "sha256-B2g2d29jSER30OUqCkdk3+Hv5T3DA4SUKoyiqHb8FeU=";
        };
      });
    })
  ];

  services.fprintd = {
    enable = true;
    # tod.enable = true;
    # tod.driver = pkgs.libfprint-2-tod1-elan;
  };
}
