{
  description = "fortuneteller2k's stash of fresh packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    rust-nightly.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };

    bling-src = { url = "github:BlingCorp/bling"; flake = false; };
    eww-src = { url = "github:elkowar/eww"; flake = false; };
    kile-wl-src = { url = "gitlab:snakedye/kile"; flake = false; };
    abstractdark-sddm-theme-src = { url = "github:3ximus/abstractdark-sddm-theme"; flake = false; };
    alacritty-src = { url = "github:zenixls2/alacritty/ligature"; flake = false; };
    downloader-cli-src = { url = "github:deepjyoti30/downloader-cli"; flake = false; };
    river-src = { url = "github:ifreund/river"; flake = false; };
    awesome-src = { url = "github:awesomeWM/awesome"; flake = false; };
    picom-src = { url = "github:yshui/picom"; flake = false; };
    slock-src = { url = "github:khuedoan/slock"; flake = false; };
    wezterm-src = { url = "github:wez/wezterm"; flake = false; };
    xmonad-src = { url = "github:xmonad/xmonad"; flake = false; };
    xmonad-contrib-src = { url = "github:xmonad/xmonad-contrib"; flake = false; };
    ytmdl-src = { url = "github:deepjyoti30/ytmdl"; flake = false; };
  };

  outputs = args@{ self, flake-utils, nixpkgs, rust-nightly, ... }:
    {
      overlay = final: prev: {
        awesome-git = self.packages.${final.system}.awesome-git;
        alacritty-ligatures = self.packages.${final.system}.alacritty-ligatures;
        bling = self.packages.${final.system}.bling;
        eww = self.packages.${final.system}.eww;
        iosevka-ft-bin = self.packages.${final.system}.iosevka-ft-bin;
        river-git = self.packages.${final.system}.river-git;
        abstractdark-sddm-theme = self.packages.${final.system}.abstractdark-sddm-theme;
        downloader-cli = self.packages.${final.system}.downloader-cli;
        kile-wl-git = self.packages.${final.system}.kile-wl-git;
        simber = self.packages.${final.system}.simber;
        pydes = self.packages.${final.system}.pydes;
        itunespy = self.packages.${final.system}.itunespy;
        picom-git = self.packages.${final.system}.picom-git;
        slock-fancy = self.packages.${final.system}.slock-fancy;
        wezterm-git = self.packages.${final.system}.wezterm-git;
        youtube-search = self.packages.${final.system}.youtube-search;
        ytmdl = self.packages.${final.system}.ytmdl;

        haskellPackages = prev.haskellPackages.extend (hfinal: hprev: rec {
          X11 = hprev.X11_1_10;

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

        version = "unstable";
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
            luaPackages = pkgs.lua52Packages;
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
              outputHash = "sha256-ttnwv8msnGMrC+s/RPK3oXe4u7rxa5m56iDfvCYnCio=";
            });
          }));

          # FIXME: awesome doesn't detect this
          bling = pkgs.callPackage ./pkgs/bling {
            inherit (pkgs.lua53Packages) lua toLuaModule;
            src = args.bling-src;
          };

          eww = pkgs.callPackage ./pkgs/eww {
            src = args.eww-src;
          };

          iosevka-ft-bin = pkgs.callPackage ./pkgs/iosevka-ft-bin { };

          kile-wl-git = pkgs.kile-wl.overrideAttrs (_: rec {
            inherit version;
            src = args.kile-wl-src;
          });

          picom-git = pkgs.picom.overrideAttrs (_: rec {
            inherit version;
            src = args.picom-src;
          });

          river-git = pkgs.river.overrideAttrs (_: rec {
            inherit version;
            src = args.river-src;
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

          wezterm-git = pkgs.wezterm.overrideAttrs (_: {
            inherit version;
            src = args.wezterm-src;
          });

          youtube-search = pkgs.python3Packages.callPackage ./pkgs/youtube-search { };

          ytmdl = pkgs.python3Packages.callPackage ./pkgs/ytmdl {
            inherit itunespy simber pydes downloader-cli youtube-search;
            src = args.ytmdl-src;
          };
        };
      }
    );
}
