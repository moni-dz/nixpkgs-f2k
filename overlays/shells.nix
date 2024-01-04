{ lib, ... }:

{
  flake.overlays.devshells = _: prev: {
    minimalMkShell = prev.mkShellNoCC.override {
      stdenv = prev.stdenvNoCC.override {
        cc = null;
        preHook = "";
        allowedRequisites = null;

        initialPath = lib.singleton (prev.coreutils.override {
          aclSupport = false;
          attrSupport = false;
          gmpSupport = false;
        });

        shell = lib.getExe (prev.bash.override { interactive = false; });
        extraNativeBuildInputs = [ ];
      };
    };
  };
}
