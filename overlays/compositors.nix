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
              pkgs.pcre2
              pkgs.libxcb-util
            ];
          };
        };
    in
    _: prev: {
      picom-git = mkPicom "picom" prev;
      picom-ft-labs-git = mkPicom "picom-ft-labs" prev;
    };
}
