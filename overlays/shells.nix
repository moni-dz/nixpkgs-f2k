{ lib, infuse, ... }:

{
  flake.overlays.devshells = _: prev: {
    minimalMkShell = infuse prev.mkShellNoCC {
      __input.stdenv.__assign = infuse prev.stdenvNoCC {
        __input = {
          cc.__assign = null;
          preHook.__assign = "";
          allowedRequisites.__assign = null;

          initialPath.__assign = lib.singleton (infuse prev.coreutils {
            __input = {
              aclSupport.__assign = false;
              attrSupport.__assign = false;
              gmpSupport.__assign = false;
            };
          });

          shell.__assign = lib.getExe (infuse prev.bash { __input.interactive.__assign = false; });
          extraNativeBuildInputs.__assign = [ ];
        };
      };
    };
  };
}
