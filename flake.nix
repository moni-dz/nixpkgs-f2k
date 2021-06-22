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
    downloader-cli-src = { url = "github:deepjyoti30/downloader-cli"; flake = false; };
    awesome-src = { url = "github:awesomeWM/awesome"; flake = false; };
    nixos-wallpapers = { url = "github:fortuneteller2k/nixos-wallpapers"; flake = false; };
    picom-src = { url = "github:yshui/picom"; flake = false; };
    slock-src = { url = "github:khuedoan/slock"; flake = false; };
    xmonad-src = { url = "github:xmonad/xmonad"; flake = false; };
    xmonad-contrib-src = { url = "github:xmonad/xmonad-contrib"; flake = false; };
    ytmdl-src = { url = "github:deepjyoti30/ytmdl"; flake = false; };
  };

  outputs = args@{ self, flake-utils, nixpkgs, rust-nightly, ... }:
    {
      overlay = final: prev: {
        awesome-git = self.packages.${final.system}.awesome-git;
        bling = self.packages.${final.system}.bling;
        eww = self.packages.${final.system}.eww;
        iosevka = self.packages.${final.system}.iosevka;
        abstractdark-sddm-theme = self.packages.${final.system}.abstractdark-sddm-theme;
        downloader-cli = self.packages.${final.system}.downloader-cli;
        nixos-wallpapers = self.packages.${final.system}.nixos-wallpapers;
        kile-wl = self.packages.${final.system}.kile-wl;
        simber = self.packages.${final.system}.simber;
        pydes = self.packages.${final.system}.pydes;
        itunespy = self.packages.${final.system}.itunespy;
        picom = self.packages.${final.system}.picom;
        slock = self.packages.${final.system}.slock;
        xmonad = self.packages.${final.system}.xmonad;
        xmonad-contrib = self.packages.${final.system}.xmonad-contrib;
        youtube-search = self.packages.${final.system}.youtube-search;
        ytmdl = self.packages.${final.system}.ytmdl;

        haskellPackages = prev.haskellPackages.extend (hfinal: hprev: {
          X11 = hprev.X11_1_10;

          xmonad = prev.haskellPackages.callPackage ./pkgs/xmonad {
            src = args.xmonad-src;
          };

          xmonad-contrib = prev.haskellPackages.callPackage ./pkgs/xmonad-contrib {
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
      in
      {
        defaultPackage = self.packages.${system}.eww;

        packages = rec {
          inherit (args) nixos-wallpapers;

          awesome-git = with pkgs; (awesome.overrideAttrs (old: rec {
            src = args.awesome-src;

            GI_TYPELIB_PATH = "${playerctl}/lib/girepository-1.0:"
            + "${upower}/lib/girepository-1.0:"
            + old.GI_TYPELIB_PATH;
          })).override {
            stdenv = clangStdenv;
            luaPackages = pkgs.lua52Packages;
            gtk3Support = true;
          };

          # FIXME: awesome doesn't detect this
          bling = pkgs.callPackage ./pkgs/bling {
            inherit (pkgs.lua53Packages) lua toLuaModule;
            src = args.bling-src;
          };

          eww = pkgs.callPackage ./pkgs/eww {
            src = args.eww-src;
          };

          iosevka = pkgs.callPackage ./pkgs/iosevka-ft-bin { };

          kile-wl = pkgs.kile-wl.overrideAttrs (old: rec { src = args.kile-wl-src; });

          picom = pkgs.picom.overrideAttrs (old: rec { src = args.picom-src; });

          slock = pkgs.slock.overrideAttrs (old: rec {
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
