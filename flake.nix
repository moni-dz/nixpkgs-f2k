{
  description = "fortuneteller2k's stash of fresh packages";

  inputs = {
    crane.url = "github:ipetkov/crane";
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    nixpkgs-fmt.url = "github:nix-community/nixpkgs-fmt";
    emacs.url = "github:nix-community/emacs-overlay";

    # follows
    crane.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-fmt.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, emacs, nixpkgs, crane, nixpkgs-fmt, ... }:
    let
      linux = [ "x86_64-linux" ];
      darwin = [ "aarch64-darwin" "x86_64-darwin" ];

      pkgsFor = system: import nixpkgs {
        inherit system;
        allowUnfree = true;
        allowUnsupportedSystem = true;

        overlays = [
          self.overlays.default
          emacs.overlay
        ];
      };
    in
    {
      nixosModules = {
        "nvidia-exec" = import ./modules/nvidia-exec.nix;
        "stevenblack" = import ./modules/stevenblack.nix;
      };

      overlays =
        let
          getPackage = pname: pkgs: (import ./_sources/generated.nix {
            inherit (pkgs) fetchgit fetchurl fetchFromGitHub dockerTools;
          }).${pname};
        in
        {
          applications = final: prev: {
            nvidia-exec =
              let
                package = getPackage "nvidia-exec" prev;
              in
              prev.callPackage ./pkgs/nvidia-exec {
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

          compositors =
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

          # If using as an overlay, you need emacs.overlay from nix-community/emacs-overlay
          editors = _: prev: {
            emacs-plus-git = prev.emacsGit.overrideAttrs (fdrv: pdrv: {
              pname = "emacs-plus-git";
              name = "${fdrv.pname}-${pdrv.version}";

              # Taken from https://github.com/d12frosted/homebrew-emacs-plus/tree/master/patches/emacs-30
              patches = (pdrv.patches or [ ]) ++ [
                (prev.fetchpatch {
                  url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-29/poll.patch";
                  hash = "sha256-jN9MlD8/ZrnLuP2/HUXXEVVd6A+aRZNYFdZF8ReJGfY=";
                })

                (prev.fetchpatch {
                  url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-30/round-undecorated-frame.patch";
                  hash = "sha256-uYIxNTyfbprx5mCqMNFVrBcLeo+8e21qmBE3lpcnd+4=";
                })

                (prev.fetchpatch {
                  url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/fix-window-role.patch";
                  hash = "sha256-+z/KfsBm1lvZTZNiMbxzXQGRTjkCFO4QPlEK35upjsE=";
                })

                (prev.fetchpatch {
                  url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/no-frame-refocus-cocoa.patch";
                  hash = "sha256-QLGplGoRpM4qgrIAJIbVJJsa4xj34axwT3LiWt++j/c=";
                })

                (prev.fetchpatch {
                  url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/system-appearance.patch";
                  hash = "sha256-oM6fXdXCWVcBnNrzXmF0ZMdp8j0pzkLE66WteeCutv8=";
                })
              ];

              platforms = prev.lib.platforms.darwin;
            });
          };

          fonts = _: prev: {
            iosevka-ft = prev.iosevka.override {
              privateBuildPlan = import ./pkgs/iosevka-ft/build-plan.nix;
              set = "ft";
            };

            iosevka-ft-qp = prev.iosevka.override {
              privateBuildPlan = import ./pkgs/iosevka-ft/build-plan-qp.nix;
              set = "ft-qp";
            };

            iosevka-ft-bin = prev.callPackage ./pkgs/iosevka-ft { };
            iosevka-ft-qp-bin = prev.callPackage ./pkgs/iosevka-ft { proportional = true; };
          };

          terminal-emulators = _: prev: {
            wezterm-git =
              let
                package = getPackage "wezterm" prev;
              in
              prev.darwin.apple_sdk_11_0.callPackage ./pkgs/wezterm {
                inherit (prev.darwin.apple_sdk_11_0.frameworks) Cocoa CoreGraphics Foundation UserNotifications;
                inherit (package) src version;
                crane-lib = crane.lib."${prev.system}";
              };
          };

          themes = _: prev: {
            phocus =
              let
                package = getPackage "phocus" prev;
              in
              prev.callPackage ./pkgs/phocus {
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

          misc = _: prev: {
            glfw-wayland-minecraft = prev.glfw-wayland.overrideAttrs (_: {
              patches = [
                # Don't crash on calls to focus or icon
                (prev.fetchpatch {
                  url = "https://raw.githubusercontent.com/Admicos/minecraft-wayland/main/0003-Don-t-crash-on-calls-to-focus-or-icon.patch";
                  hash = "sha256-3U/nzFUI8nz3ixxhRFzgppoWH62kNMlGJnXSaJPbtRY=";
                })

                # wayland: fix broken opengl screenshots on mutter
                (prev.fetchpatch {
                  url = "https://raw.githubusercontent.com/Admicos/minecraft-wayland/main/0004-wayland-fix-broken-opengl-screenshots-on-mutter.patch";
                  hash = "sha256-ZVlnXZkqp7B5WZzzkMGjAyYvjmidlZyYvpa0z3GNW4U=";
                })

                # Add warning about being an unofficial patch
                (prev.fetchpatch {
                  url = "https://raw.githubusercontent.com/Admicos/minecraft-wayland/main/0005-Add-warning-about-being-an-unofficial-patch.patch";
                  hash = "sha256-j/z6c/bGKFtCwBvIVNGi63xa+7yIF1mRKc9q3Ykigaw=";
                })
              ];
            });

            mpv-discord =
              let
                package = getPackage "mpv-discord" prev;
              in
              prev.callPackage ./pkgs/mpv-discord { inherit (package) src version; };

            mpv-discord-script =
              let
                package = getPackage "mpv-discord" prev;
              in
              prev.callPackage ./pkgs/mpv-discord/script.nix { inherit (package) src version; };

            stevenblack-blocklist-git = (getPackage "stevenblack-blocklist" prev).src;
          };

          window-managers = final: prev:
            let
              mkAwesome = name: pkgs:
                let
                  package = getPackage name pkgs;
                  extraGIPackages = with pkgs; [ networkmanager upower playerctl ];
                in
                (pkgs.awesome.override { gtk3Support = true; }).overrideAttrs (_: {
                  inherit (package) src version;

                  patches = [ ];

                  postPatch = ''
                    patchShebangs tests/examples/_postprocess.lua
                    patchShebangs tests/examples/_postprocess_cleanup.lua
                  '';

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

          stdenvs = final: prev:
            let
              commonFlags = [
                "-O3"
                "-pipe"
                "-ffloat-store"
                "-fexcess-precision=fast"
                "-ffast-math"
                "-fno-rounding-math"
                "-fno-signaling-nans"
                "-fno-math-errno"
                "-funsafe-math-optimizations"
                "-fassociative-math"
                "-freciprocal-math"
                "-ffinite-math-only"
                "-fno-signed-zeros"
                "-fno-trapping-math"
                "-frounding-math"
                "-fsingle-precision-constant"
                # not supported on clang 14 yet, and isn't ignored
                # "-fcx-limited-range"
                # "-fcx-fortran-rules"
              ];

              /*
                Example:

                { lib, clangStdenv, ... }:

                (lib.optimizeStdenv "armv9-a" clangStdenv).mkDerivation { ... }
              */
              optimizeStdenv = march: prev.stdenvAdapters.withCFlags (commonFlags ++ [ "-march=${march}" ]);

              /*
                Example:

                { lib, stdenv, ... }:

                (lib.optimizeStdenvWithNative stdenv).mkDerivation { ... }
              */
              optimizeStdenvWithNative = stdenv: prev.stdenvAdapters.impureUseNativeOptimizations (prev.stdenvAdapters.withCFlags commonFlags stdenv);
            in
            {
              lib = prev.lib.extend (_: _: { inherit optimizeStdenv optimizeStdenvWithNative; });
              optimizedV4Stdenv = final.lib.optimizeStdenv "x86-64-v4" prev.stdenv;
              optimizedV3Stdenv = final.lib.optimizeStdenv "x86-64-v3" prev.stdenv;
              optimizedV2Stdenv = final.lib.optimizeStdenv "x86-64-v2" prev.stdenv;
              optimizedNativeStdenv = prev.lib.warn "using native optimizations, forfeiting reproducibility" optimizeStdenvWithNative prev.stdenv;
              optimizedV4ClangStdenv = final.lib.optimizeStdenv "x86-64-v4" prev.llvmPackages_14.stdenv;
              optimizedV3ClangStdenv = final.lib.optimizeStdenv "x86-64-v3" prev.llvmPackages_14.stdenv;
              optimizedV2ClangStdenv = final.lib.optimizeStdenv "x86-64-v2" prev.llvmPackages_14.stdenv;
              optimizedNativeClangStdenv = prev.lib.warn "using native optimizations, forfeiting reproducibility" optimizeStdenvWithNative prev.llvmPackages_14.stdenv;
            };

          darwin = final: prev: with self.overlays;
            (fonts final prev)
            // (editors final prev)
            // (terminal-emulators final prev)
            // (stdenvs final prev);

          linux = final: prev: with self.overlays;
            (applications final prev)
            // (compositors final prev)
            // (fonts final prev)
            // (terminal-emulators final prev)
            // (themes final prev)
            // (misc final prev)
            // (window-managers final prev)
            // (stdenvs final prev);

          default = self.overlays.linux;
        };

      packages = (nixpkgs.lib.genAttrs linux (system:
        let
          pkgs = pkgsFor system;
        in
        builtins.removeAttrs (self.overlays.linux pkgs pkgs) [ "lib" ]
      ))
      //
      (nixpkgs.lib.genAttrs darwin (system:
        let
          pkgs = pkgsFor system;
        in
        builtins.removeAttrs (self.overlays.darwin pkgs pkgs) [ "lib" ]
      ));

      formatter = nixpkgs.lib.genAttrs (darwin ++ linux) (system: nixpkgs-fmt.defaultPackage.${system});
    };
}
