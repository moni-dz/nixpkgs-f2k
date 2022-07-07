{
  description = "fortuneteller2k's stash of fresh packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    crane.url = "github:ipetkov/crane";

    # nvfetcher seems to don't like wezterm
    wezterm-src = {
      type = "git";
      url = "https://github.com/wez/wezterm.git";
      ref = "main";
      submodules = true;
      flake = false;
    };
  };

  outputs = args@{ self, nixpkgs, crane, ... }:
    {
      overlay = nixpkgs.lib.warn "nixpkgs-f2k.overlay is deprecated, use nixpkgs-f2k.overlays.default instead" self.overlays.default;

      overlays =
        let
          getPackage = pname: pkgs: (import ./_sources/generated.nix {
            inherit (pkgs) fetchgit fetchurl fetchFromGitHub;
          }).${pname};
        in
        {
          applications = final: prev: {
            # remove after a week -- 7/14/2022
            discord-openasar = builtins.throw "discord with openasar has been upstreamed, use it from nixpkgs";
          };

          compositors = final: prev: {
            picom-git = prev.picom.overrideAttrs (_:
              let
                package = getPackage "picom" prev;
              in
              {
                inherit (package) src version;
              });

            picom-dccsillag = prev.picom.overrideAttrs (_:
              let
                package = getPackage "picom-dccsillag" prev;
              in
              {
                inherit (package) src version;
              });

            picom-pijulius = prev.picom.overrideAttrs (_:
              let
                package = getPackage "picom-pijulius" prev;
              in
              {
                inherit (package) src version;
              });
          };

          fonts = final: prev: {
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

          terminal-emulators = final: prev: {
            wezterm-git = prev.callPackage ./pkgs/wezterm {
              src = args.wezterm-src;
              version = "999-unstable";
              crane-lib = crane.lib."${prev.system}";
            };
          };

          themes = final: prev: {
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

          misc = final: prev: {
            glfw-wayland-minecraft = prev.glfw-wayland.overrideAttrs (old: {
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
              prev.callPackage ./pkgs/mpv-discord {
                inherit (package) src version;
              };

            mpv-discord-script =
              let
                package = getPackage "mpv-discord" prev;
              in
              prev.callPackage ./pkgs/mpv-discord/script.nix {
                inherit (package) src version;
              };
          };

          window-managers = final: prev: {
            awesome-git = (prev.awesome.overrideAttrs (old:
              let
                package = getPackage "awesome" prev;
              in
              {
                inherit (package) src version;
                patches = [ ];

                GI_TYPELIB_PATH = "${prev.playerctl}/lib/girepository-1.0:"
                  + "${prev.upower}/lib/girepository-1.0:"
                  + "${prev.networkmanager}/lib/girepository-1.0:"
                  + old.GI_TYPELIB_PATH;
              })).override {
              gtk3Support = true;
            };

            # Yes, it's a *compositor* because of how Wayland works, I can't be bothered.
            river-git = prev.river.overrideAttrs (_:
              let
                package = getPackage "river" prev;
              in
              {
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
              optimizeStdenv = march: prev.stdenvAdapters.withCFlags (commonFlags ++ "-march=${march}");

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
              optimizedV4ClangStdenv = final.optimizeStdenv "x86-64-v4" prev.llvmPackages_14.stdenv;
              optimizedV3ClangStdenv = final.optimizeStdenv "x86-64-v3" prev.llvmPackages_14.stdenv;
              optimizedV2ClangStdenv = final.optimizeStdenv "x86-64-v2" prev.llvmPackages_14.stdenv;
              optimizedNativeClangStdenv = prev.lib.warn "using native optimizations, forfeiting reproducibility" optimizeStdenvWithNative prev.llvmPackages_14.stdenv;
            };

          default = final: prev: with self.overlays;
            (applications final prev)
            // (compositors final prev)
            // (fonts final prev)
            // (terminal-emulators final prev)
            // (themes final prev)
            // (misc final prev)
            // (window-managers final prev)
            // (stdenvs final prev);
        };

      packages = nixpkgs.lib.genAttrs [ "aarch64-linux" "x86_64-linux" ] (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            allowUnfree = true;
            overlays = [ self.overlays.stdenvs ];
          };
        in
        self.overlays.default pkgs pkgs
      );
    };
}
