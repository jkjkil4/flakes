{ config, pkgs, lib, ... }:

let
  python = pkgs.python313;
in
{
  home.packages = [
    pkgs.uv

    (python.withPackages (ps: [
      ps.websockets
      ps.qrcode
    ]))
  ];

  home.sessionVariables = {
    UV_PYTHON_DOWNLOADS = "never";
    UV_PYTHON = python.interpreter;
    # LD_LIBRARY_PATH = 
    #   lib.makeLibraryPath (
    #     pkgs.pythonManylinuxPackages.manylinux1
    #   );
  };
}
