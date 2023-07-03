{ getPackage, ... }:

{
  flake.overlays.applications = final: prev: {
    nvidia-exec =
      let
        package = getPackage "nvidia-exec" prev;
      in
      prev.callPackage ../pkgs/nvidia-exec {
        inherit (package) src version;
        lshw = final.lshw-git;
      };

    lshw-git =
      let
        package = getPackage "lshw" prev;
      in
      prev.lshw.overrideAttrs (old: {
        inherit (package) src version;

        nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ [ prev.gettext ];
      });
  };
}
