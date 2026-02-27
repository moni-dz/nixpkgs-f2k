{ getPackage, infuse, ... }:

{
  flake.overlays.window-managers = final: prev:
    let
      mkAwesome = name: pkgs:
        let
          package = getPackage name pkgs;
          extraGIPackages = with pkgs; [ networkmanager upower playerctl ];
        in
        infuse pkgs.awesome {
          __input.gtk3Support.__assign = true;
          __output = {
            src.__assign = package.src;
            version.__assign = package.version;
            patches.__assign = [ ];

            cmakeFlags.__append = [ "-DGENERATE_MANPAGES=OFF" ];

            env.GI_TYPELIB_PATH.__assign =
              let
                mkTypeLibPath = pkg: "${pkg}/lib/girepository-1.0";
                extraGITypeLibPaths = prev.lib.forEach extraGIPackages mkTypeLibPath;
              in
              prev.lib.concatStringsSep ":" (extraGITypeLibPaths ++ [ (mkTypeLibPath prev.pango.out) ]);
              
            postPatch.__assign = ''
              patchShebangs tests/examples/_postprocess.lua
              patchShebangs tests/examples/_postprocess_cleanup.lua
            '';
          };
        };
    in
    {
      awesome-git = mkAwesome "awesome" prev;
      awesome-composite-git = mkAwesome "awesome-composite" prev;

      awesome-luajit-git = infuse final.awesome-git {
        __input.lua.__assign = prev.luajit;
      };
    };
}

