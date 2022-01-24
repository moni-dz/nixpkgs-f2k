{
  description = "fortuneteller2k's stash of fresh packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    rust-nightly.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };

    ### Equivalent to multiple fetchFromGit[Hub/Lab] invocations
    # Programs
    alacritty-src = { url = "github:zenixls2/alacritty/ligature"; flake = false; };

    # Utilities
    eww.url = "github:elkowar/eww";

    # X11
    awesome-src = { url = "github:awesomeWM/awesome"; flake = false; };
    xmonad.url = "github:xmonad/xmonad";
    xmonad-contrib.url = "github:xmonad/xmonad-contrib";
    picom-src = { url = "github:yshui/picom"; flake = false; };
    picom-dccsillag = { url = "github:dccsillag/picom/implement-window-animations"; flake = false; };
    picom-pijulius = { url = "github:pijulius/picom/implement-window-animations"; flake = false; };

    # Wayland
    kile-wl-src = { url = "gitlab:snakedye/kile"; flake = false; };
    river-src = { type = "git"; url = "https://github.com/ifreund/river.git"; submodules = true; flake = false; };
    sway-borders-src = { url = "github:fluix-dev/sway-borders"; flake = false; };
  };

  outputs = args@{ self, flake-utils, nixpkgs, nixpkgs-wayland, rust-nightly, ... }:
    {
      overlay = final: prev: {
        inherit (self.packages.${final.system})
          # Programs
          alacritty-ligatures
          discord-openasar
          discord-ptb-openasar
          discord-canary-openasar
          # Utilities
          eww
          # X11
          awesome-git
          picom-git
          picom-dccsillag
          picom-pijulius
          # Wayland
          kile-wl-git
          river-git
          sway-borders
          # Fonts
          iosevka-ft
          iosevka-ft-qp
          iosevka-ft-bin
          iosevka-ft-qp-bin;

        haskellPackages = prev.haskellPackages.extend (hfinal: hprev: rec {
          inherit (self.packages.${final.system}) xmonad xmonad-contrib;
        });
      };
    }
    // flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          allowBroken = true;
          allowUnfree = true;
          allowUnsupportedSystem = true;
          overlays = [ rust-nightly.overlay ];
        };

        version = "999-unstable";
      in
      {
        defaultPackage = self.packages.${system}.eww;

        packages = rec {
          awesome-git = with pkgs; (awesome.overrideAttrs (old: rec {
            inherit version;
            src = args.awesome-src;

            GI_TYPELIB_PATH = "${playerctl}/lib/girepository-1.0:"
            + "${upower}/lib/girepository-1.0:"
            + old.GI_TYPELIB_PATH;
          })).override {
            gtk3Support = true;
          };

          alacritty-ligatures = with pkgs; (alacritty.overrideAttrs (old: rec {
            src = args.alacritty-src;

            postInstall = ''
              install -D extra/linux/Alacritty.desktop -t $out/share/applications/
              install -D extra/logo/compat/alacritty-term.svg $out/share/icons/hicolor/scalable/apps/Alacritty.svg
              strip -S $out/bin/alacritty
              patchelf --set-rpath "${lib.makeLibraryPath old.buildInputs}:${stdenv.cc.cc.lib}/lib${lib.optionalString stdenv.is64bit "64"}" $out/bin/alacritty
              installShellCompletion --zsh extra/completions/_alacritty
              installShellCompletion --bash extra/completions/alacritty.bash
              installShellCompletion --fish extra/completions/alacritty.fish
              install -dm755 "$out/share/man/man1"
              gzip -c extra/alacritty.man > "$out/share/man/man1/alacritty.1.gz"
              install -Dm644 alacritty.yml $out/share/doc/alacritty.yml
              install -dm755 "$terminfo/share/terminfo/a/"
              tic -xe alacritty,alacritty-direct -o "$terminfo/share/terminfo" extra/alacritty.info
              mkdir -p $out/nix-support
              echo "$terminfo" >> $out/nix-support/propagated-user-env-packages
            '';

            cargoDeps = old.cargoDeps.overrideAttrs (_: {
              inherit src;
              outputHash = "sha256-nbzGpxGvwFD7zLP2DApAihkCrgeIBIXOEnO8+bYb7M8=";
            });
          }));

          discord-openasar = import ./pkgs/discord {
            branch = "stable";
            inherit pkgs;
          };

          discord-ptb-openasar = import ./pkgs/discord {
            branch = "ptb";
            inherit pkgs;
          };

          discord-canary-openasar = import ./pkgs/discord {
            branch = "canary";
            inherit pkgs;
          };

          eww = args.eww.defaultPackage.${system};

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

          kile-wl-git = pkgs.kile-wl.overrideAttrs (_: rec {
            inherit version;
            src = args.kile-wl-src;
          });

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

          river-git = (pkgs.river.overrideAttrs (_: rec {
            inherit version;
            src = args.river-src;
          })).override {
            inherit (nixpkgs-wayland.packages.${system}) wlroots;
          };

          sway-borders = nixpkgs-wayland.packages.${system}.sway-unwrapped.overrideAttrs (_: rec {
            inherit version;
            src = args.sway-borders-src;
          });

          xmonad = args.xmonad.defaultPackage.${system};
          xmonad-contrib = args.xmonad-contrib.defaultPackage.${system};
        };
      }
    );
}
