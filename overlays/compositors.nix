{ getPackage, ... }:

{
  flake.overlays.compositors =
    let
      mkPicom = name: pkgs:
        let
          package = getPackage name pkgs;
        in
        pkgs.picom.overrideAttrs (old: {
          inherit (package) src version;
          buildInputs = (old.buildInputs or [ ]) ++ [
            pkgs.pcre2
            pkgs.xorg.xcbutil
          ];
        });
    in
    _: prev: {
      picom-git = mkPicom "picom" prev;
      picom-dccsillag = mkPicom "picom-dccsillag" prev;
      picom-ft-labs = mkPicom "picom-ft-labs" prev;
      picom-pijulius = mkPicom "picom-pijulius" prev;
    };
}
