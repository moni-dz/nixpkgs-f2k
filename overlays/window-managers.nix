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

            patches.__assign = [
	      (pkgs.fetchpatch2 {
		url = "https://patch-diff.githubusercontent.com/raw/awesomeWM/awesome/pull/4030.patch";
		hash = "sha256-vidbg6f79f8aK8fjHoXe29PB4E4MyCyCA3Fq/tervlA=";
	      })
	    ];

            cmakeFlags.__append = [ "-DGENERATE_MANPAGES=OFF" ];

            GI_TYPELIB_PATH.__assign =
              let
                mkTypeLibPath = pkg: "${pkg}/lib/girepository-1.0";
                extraGITypeLibPaths = prev.lib.forEach extraGIPackages mkTypeLibPath;
              in
              prev.lib.concatStringsSep ":" (extraGITypeLibPaths ++ [ (mkTypeLibPath prev.pango.out) ]);

            postPatch.__assign = ''
              patchShebangs tests/examples/_postprocess.lua
              patchShebangs tests/examples/_postprocess_cleanup.lua

	        
              substituteInPlace {,tests/examples/}CMakeLists.txt \
                --replace-fail 'cmake_minimum_required(VERSION 3.0.0)' 'cmake_minimum_required(VERSION 3.10)' \
                --replace-warn 'cmake_policy(VERSION 2.6)' 'cmake_policy(VERSION 3.10)'
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

