{ config, pkgs, lib, ... }:

let
  python = pkgs.python313;
in
{
  home.packages = [
    python
    pkgs.uv
  ];

  home.sessionVariables = {
    UV_PYTHON_DOWNLOADS = "never";
    UV_PYTHON = python.interpreter;
    LD_LIBRARY_PATH = 
      lib.makeLibraryPath (
        pkgs.pythonManylinuxPackages.manylinux1
      );
  };
}
