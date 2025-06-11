{ getPackage, infuse, ... }:

{
  flake.overlays.compositors =
    let
      mkPicom = name: pkgs:
        let
          package = getPackage name pkgs;
        in
        infuse pkgs.picom {
          __output = {
            src.__assign = package.src;
            version.__assign = package.version;
            dontVersionCheck.__assign = true;

            nativeBuildInputs.__append = [
              pkgs.asciidoc
            ];

            buildInputs.__append = [
              pkgs.pcre
              pkgs.pcre2
              pkgs.xorg.xcbutil
            ];
          };
        };
    in
    _: prev: {
      picom-git = mkPicom "picom" prev;
      picom-dccsillag-git = mkPicom "picom-dccsillag" prev;
      picom-ft-labs-git = mkPicom "picom-ft-labs" prev;
      picom-pijulius-git = mkPicom "picom-pijulius" prev;
    };
}
