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
      picom-dccsillag-git = mkPicom "picom-dccsillag" prev;
      picom-ft-labs-git = mkPicom "picom-ft-labs" prev;
      picom-pijulius-git = mkPicom "picom-pijulius" prev;
    };
}
