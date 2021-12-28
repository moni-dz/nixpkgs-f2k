{
  description = "fortuneteller2k's stash of fresh packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    rust-nightly.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };

    ### Equivalent to multiple fetchFromGit[Hub/Lab] invocations
    # Themes
    abstractdark-sddm-theme-src = { url = "github:3ximus/abstractdark-sddm-theme"; flake = false; };

    # Programs
    alacritty-src = { url = "github:zenixls2/alacritty/ligature"; flake = false; };
    downloader-cli-src = { url = "github:deepjyoti30/downloader-cli"; flake = false; };
    slock-src = { url = "github:khuedoan/slock"; flake = false; };
    ytmdl-src = { url = "github:deepjyoti30/ytmdl"; flake = false; };

    # Utilities
    bling-src = { url = "github:BlingCorp/bling"; flake = false; };
    eww.url = "github:elkowar/eww";

    # X11
    awesome-src = { url = "github:awesomeWM/awesome"; flake = false; };
    xmonad-src = { url = "github:xmonad/xmonad"; flake = false; };
    xmonad-contrib-src = { url = "github:xmonad/xmonad-contrib"; flake = false; };
    picom-src = { url = "github:yshui/picom"; flake = false; };
    picom-dccsillag = { url = "github:dccsillag/picom/implement-window-animations"; flake = false; };
    picom-pijulius = { url = "github:pijulius/picom/implement-window-animations"; flake = false; };

    # Wayland
    kile-wl-src = { url = "gitlab:snakedye/kile"; flake = false; };
    river-src = { type = "git"; url = "https://github.com/ifreund/river.git"; submodules = true; flake = false; };
    sway-borders-src = { url = "github:fluix-dev/sway-borders/9ecbfe366596f627e843886d94e47097e19df5d5"; flake = false; };
  };

  outputs = args@{ self, flake-utils, nixpkgs, nixpkgs-wayland, rust-nightly, ... }:
    {
      overlay = final: prev: {
        inherit (self.packages.${final.system})
          # Themes
          abstractdark-sddm-theme
          # Programs
          alacritty-ligatures
          pydes
          simber
          youtube-search
          ytmdl
          # Utilities
          downloader-cli
          itunespy
          eww
          # X11
          awesome-git
          bling
          picom-git
          picom-dccsillag
          picom-pijulius
          slock-fancy
          # Wayland
          kile-wl-git
          river-git
          # Fonts
          iosevka-ft-bin;

        haskellPackages = prev.haskellPackages.extend (hfinal: hprev: rec {
          xmonad = prev.haskellPackages.callPackage ./pkgs/xmonad {
            src = args.xmonad-src;
          };

          xmonad-contrib = prev.haskellPackages.callPackage ./pkgs/xmonad-contrib {
            inherit xmonad;
            src = args.xmonad-contrib-src;
          };
        });
      };
    }
    // flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          allowBroken = true;
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
            stdenv = clangStdenv;
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
              outputHash = "sha256-tY5sle1YUlUidJcq7RgTzkPsGLnWyG/3rtPqy2GklkY=";
            });
          }));

          # FIXME: awesome doesn't detect this
          bling = pkgs.callPackage ./pkgs/bling {
            inherit (pkgs.lua53Packages) lua toLuaModule;
            src = args.bling-src;
          };

          eww = args.eww.defaultPackage.${system};

          iosevka-ft-bin = pkgs.callPackage ./pkgs/iosevka-ft-bin { };

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

          slock-fancy = pkgs.slock.overrideAttrs (_: rec {
            inherit version;
            src = args.slock-src;
            patches = [ ./patches/slock_patch.diff ];
          });


          abstractdark-sddm-theme = pkgs.callPackage ./pkgs/abstractdark-sddm-theme {
            src = args.abstractdark-sddm-theme-src;
          };

          simber = pkgs.python3Packages.callPackage ./pkgs/simber { };

          pydes = pkgs.python3Packages.callPackage ./pkgs/pydes { };

          downloader-cli = pkgs.python3Packages.callPackage ./pkgs/downloader-cli {
            src = args.downloader-cli-src;
          };

          itunespy = pkgs.python3Packages.callPackage ./pkgs/itunespy { };

          youtube-search = pkgs.python3Packages.callPackage ./pkgs/youtube-search { };

          ytmdl = pkgs.python3Packages.callPackage ./pkgs/ytmdl {
            inherit itunespy simber pydes downloader-cli youtube-search;
            src = args.ytmdl-src;
          };
        };
      }
    );
}
