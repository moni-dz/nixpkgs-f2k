{ getPackage, ... }:

{
  flake.overlays.window-managers = final: prev:
    let
      mkAwesome = name: pkgs:
        let
          package = getPackage name pkgs;
          extraGIPackages = with pkgs; [ networkmanager upower playerctl ];
        in
        (pkgs.awesome.override { gtk3Support = true; }).overrideAttrs (old: {
          inherit (package) src version;

          patches = [ ];

          postPatch = ''
            patchShebangs tests/examples/_postprocess.lua
            patchShebangs tests/examples/_postprocess_cleanup.lua
          '';

          cmakeFlags = old.cmakeFlags ++ [ "-DGENERATE_MANPAGES=OFF" ];

          GI_TYPELIB_PATH =
            let
              mkTypeLibPath = pkg: "${pkg}/lib/girepository-1.0";
              extraGITypeLibPaths = prev.lib.forEach extraGIPackages mkTypeLibPath;
            in
            prev.lib.concatStringsSep ":" (extraGITypeLibPaths ++ [ (mkTypeLibPath prev.pango.out) ]);
        });
    in
    {
      awesome-git = mkAwesome "awesome" prev;
      awesome-composite-git = mkAwesome "awesome-composite" prev;

      awesome-luajit-git = final.awesome-git.override {
        lua = prev.luajit;
        gtk3Support = true;
      };

      # Yes, it's a *compositor* because of how Wayland works, I can't be bothered.
      river-git =
        let
          package = getPackage "river" prev;
        in
        prev.river.overrideAttrs (_: {
          inherit (package) src version;
        });
    };
}
