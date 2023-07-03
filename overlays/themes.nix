{ getPackage, ... }:

{
  flake.overlays.themes = _: prev: {
    phocus =
      let
        package = getPackage "phocus" prev;
      in
      prev.callPackage ../pkgs/phocus/vanilla.nix {
        inherit (package) src version;
        inherit (prev.nodePackages) sass;
      };

    phocus-modified =
      let
        package = getPackage "phocus" prev;
      in
      prev.callPackage ../pkgs/phocus {
        inherit (package) src version;

        inherit (prev.nodePackages) sass;

        colors = {
          base00 = "212121";
          base01 = "303030";
          base02 = "353535";
          base03 = "4A4A4A";
          base04 = "B2CCD6";
          base05 = "EEFFFF";
          base06 = "EEFFFF";
          base07 = "FFFFFF";
          base08 = "F07178";
          base09 = "F78C6C";
          base0A = "FFCB6B";
          base0B = "C3E88D";
          base0C = "89DDFF";
          base0D = "82AAFF";
          base0E = "C792EA";
          base0F = "FF5370";
        };

        primary = "F07178";
        secondary = "C3E88D";
      };
  };
}
