{
  description = "fortuneteller2k's stash of fresh packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    naersk.url = "github:nix-community/naersk";
    eww.url = "github:elkowar/eww";

    /*
      Equivalent to multiple fetchFromGit[Hub/Lab] invocations

      Yes, this is me abusing `flake = false` against it's intended behavior.
    */
    phocus-src = { url = "github:phocus/gtk"; flake = false; };
    mpv-discord-src = { url = "github:tnychn/mpv-discord"; flake = false; };
    awesome-src = { url = "github:awesomeWM/awesome"; flake = false; };
    picom-src = { url = "github:yshui/picom"; flake = false; };
    picom-dccsillag = { url = "github:dccsillag/picom/implement-window-animations"; flake = false; };
    picom-pijulius = { url = "github:pijulius/picom/implement-window-animations"; flake = false; };
    river-src = { type = "git"; url = "https://github.com/ifreund/river.git"; submodules = true; flake = false; };

    wezterm-git-src = {
      type = "git";
      url = "https://github.com/wez/wezterm.git";
      ref = "main";
      submodules = true;
      flake = false;
    };
  };

  outputs = args@{ self, nixpkgs, naersk, ... }:
    {
      overlay = nixpkgs.lib.warn "nixpkgs-f2k.overlay is deprecated, use nixpkgs-f2k.overlays.default instead" self.overlays.default;

      overlays =
        let
          version = "999-unstable";
        in
        {
          applications = final: prev: {
            discord-openasar = prev.callPackage ./pkgs/discord {
              branch = "stable";
            };
          };

          compositors = final: prev: {
            picom-git = prev.picom.overrideAttrs (_: rec {
              inherit version;
              src = args.picom-src;
            });

            picom-dccsillag = prev.picom.overrideAttrs (_: rec {
              inherit version;
              src = args.picom-dccsillag;
            });

            picom-pijulius = prev.picom.overrideAttrs (_: rec {
              inherit version;
              src = args.picom-pijulius;
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
              inherit version;
              naersk-lib = naersk.lib."${prev.system}";
              src = args.wezterm-git-src;
            };
          };

          themes = final: prev: {
            phocus = prev.callPackage ./pkgs/phocus {
              inherit version;
              src = args.phocus-src;

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
            inherit (args.eww.packages.${prev.system}) eww eww-wayland;

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

            mpv-discord = prev.callPackage ./pkgs/mpv-discord {
              inherit version;
              src = args.mpv-discord-src;
            };

            mpv-discord-script = prev.callPackage ./pkgs/mpv-discord/script.nix {
              inherit version;
              src = args.mpv-discord-src;
            };
          };

          window-managers = final: prev: {
            awesome-git = (prev.awesome.overrideAttrs (old: rec {
              inherit version;
              src = args.awesome-src;
              patches = [ ];

              GI_TYPELIB_PATH = "${prev.playerctl}/lib/girepository-1.0:"
                + "${prev.upower}/lib/girepository-1.0:"
                + "${prev.networkmanager}/lib/girepository-1.0:"
                + old.GI_TYPELIB_PATH;
            })).override {
              gtk3Support = true;
            };

            # Yes, it's a *compositor* because of how Wayland works, I can't be bothered.
            river-git = prev.river.overrideAttrs (_: rec {
              inherit version;
              src = args.river-src;
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

                (lib.optimizedStdenv "armv9-a" clangStdenv).mkDerivation { ... }
              */
              optimizeStdenv = march: prev.stdenvAdapters.addAttrsToDerivation {
                NIX_CFLAGS_COMPILE = prev.lib.concatStringsSep " " (commonFlags ++ [ "-march=${march}" ]);
              };
            in
            {
              lib = prev.lib // { inherit optimizeStdenv; };
            }
            //
            (with prev; {
              optimizedV4Stdenv = optimizeStdenv "x86-64-v4" stdenv;
              optimizedV3Stdenv = optimizeStdenv "x86-64-v3" stdenv;
              optimizedV2Stdenv = optimizeStdenv "x86-64-v2" stdenv;
              optimizedNativeStdenv = lib.warn "using native optimizations, forfeiting reproducibility" optimizeStdenv "native" stdenv;
              optimizedV4ClangStdenv = optimizeStdenv "x86-64-v4" llvmPackages_14.stdenv;
              optimizedV3ClangStdenv = optimizeStdenv "x86-64-v3" llvmPackages_14.stdenv;
              optimizedV2ClangStdenv = optimizeStdenv "x86-64-v2" llvmPackages_14.stdenv;
              optimizedNativeClangStdenv = lib.warn "using native optimizations, forfeiting reproducibility" optimizeStdenv "native" llvmPackages_14.stdenv;
            });

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
