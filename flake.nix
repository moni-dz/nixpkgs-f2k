{
  description = "fortuneteller2k's stash of fresh packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";

    /*
      Equivalent to multiple fetchFromGit[Hub/Lab] invocations

      Yes, this is me abusing `flake = false` against it's intended behavior.
    */

    # Themes
    phocus-src = { url = "github:phocus/gtk"; flake = false; };

    # Utilities
    eww.url = "github:elkowar/eww";

    # X11
    awesome-src = { url = "github:awesomeWM/awesome"; flake = false; };
    picom-src = { url = "github:yshui/picom"; flake = false; };
    picom-dccsillag = { url = "github:dccsillag/picom/implement-window-animations"; flake = false; };
    picom-pijulius = { url = "github:pijulius/picom/implement-window-animations"; flake = false; };

    # Wayland
    river-src = { type = "git"; url = "https://github.com/ifreund/river.git"; submodules = true; flake = false; };
  };

  outputs = args@{ self, flake-utils, nixpkgs, ... }:
    {
      overlay = final: prev: {
        inherit (self.packages.${final.system})
          # Programs
          discord-openasar
          # Themes
          phocus
          # Utilities
          eww
          eww-wayland
          # X11
          awesome-git
          picom-git
          picom-dccsillag
          picom-pijulius
          # Wayland
          river-git
          # Fonts
          iosevka-ft
          iosevka-ft-qp
          iosevka-ft-bin
          iosevka-ft-qp-bin;
      };
    }
    // flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          allowBroken = true;
          allowUnfree = true;
        };

        version = "999-unstable";
      in
      {
        packages = rec {
          awesome-git = (pkgs.awesome.overrideAttrs (old: rec {
            inherit version;
            src = args.awesome-src;

            GI_TYPELIB_PATH = "${pkgs.playerctl}/lib/girepository-1.0:"
            + "${pkgs.upower}/lib/girepository-1.0:"
            + "${pkgs.networkmanager}/lib/girepository-1.0:"
            + old.GI_TYPELIB_PATH;
          })).override {
            gtk3Support = true;
          };

          discord-openasar = import ./pkgs/discord {
            branch = "stable";
            inherit pkgs;
            inherit (pkgs.nodePackages) asar;
            inherit (pkgs) electron;
          };

          inherit (args.eww.packages.${system}) eww eww-wayland;

          iosevka-ft = pkgs.iosevka.override {
            privateBuildPlan = import ./pkgs/iosevka-ft/build-plan.nix;
            set = "ft";
          };

          iosevka-ft-qp = pkgs.iosevka.override {
            privateBuildPlan = import ./pkgs/iosevka-ft/build-plan-qp.nix;
            set = "ft-qp";
          };

          iosevka-ft-bin = pkgs.callPackage ./pkgs/iosevka-ft { };
          iosevka-ft-qp-bin = pkgs.callPackage ./pkgs/iosevka-ft { proportional = true; };

          phocus = pkgs.callPackage ./pkgs/phocus {
            inherit version;
            src = args.phocus-src;

            inherit (pkgs.nodePackages) sass;

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

          picom-git = pkgs.picom.overrideAttrs (_: rec {
            inherit version;
            src = args.picom-src;
          });

          picom-dccsillag = pkgs.picom.overrideAttrs (_: rec {
            inherit version;
            src = args.picom-dccsillag;
          });

          picom-pijulius = pkgs.picom.overrideAttrs (_: rec {
            inherit version;
            src = args.picom-pijulius;
          });

          river-git = pkgs.river.overrideAttrs (_: rec {
            inherit version;
            src = args.river-src;
          });
        };
      }
    );
}
