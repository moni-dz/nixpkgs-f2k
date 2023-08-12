{ lib, ... }:

{
  flake.overlays.devshells = _: prev: {
    minimalMkShell = prev.mkShellNoCC.override {
      stdenv = prev.stdenvNoCC.override {
        cc = null;
        preHook = "";
        allowedRequisites = null;
        initialPath = lib.singleton prev.toybox;
        shell = lib.getExe prev.bash;
        extraNativeBuildInputs = [ ];
      };
    };
  };
}
