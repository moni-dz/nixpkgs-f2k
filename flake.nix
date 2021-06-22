{
  description = "";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-nightly.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };

    bling-src = { url = "github:BlingCorp/bling"; flake = false; };
    eww-src = { url = "github:elkowar/eww"; flake = false; };
    abstractdark-sddm-theme-src = { url = "github:3ximus/abstractdark-sddm-theme"; flake = false; };
    downloader-cli-src = { url = "github:deepjyoti30/downloader-cli"; flake = false; };
    awesome-src = { url = "github:awesomeWM/awesome"; flake = false; };
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
        simber = self.packages.${final.system}.simber;
        pydes = self.packages.${final.system}.pydes;
        itunespy = self.packages.${final.system}.itunespy;
        youtube-search = self.packages.${final.system}.youtube-search;
        ytmdl = self.packages.${final.system}.ytmdl;
      };
    }
    // flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          allowUnsupportedSystem = true;
          overlays = [ rust-nightly.overlay ];
        };
      in
      {
        defaultPackage = self.packages.${system}.eww;

        packages = rec {
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

          bling = pkgs.callPackage ./pkgs/bling {
            inherit (pkgs.lua53Packages) lua toLuaModule;
            src = args.bling-src;
          };

          eww = pkgs.callPackage ./pkgs/eww {
            src = args.eww-src;
          };

          iosevka = pkgs.callPackage ./pkgs/iosevka-ft-bin { };

          abstractdark-sddm-theme = pkgs.callPackage ./pkgs/abstractdark-sddm-theme {
            src = args.abstractdark-sddm-theme-src;
          };

          simber = pkgs.callPackage ./pkgs/simber { };

          pydes = pkgs.callPackage ./pkgs/pydes { };

          downloader-cli = pkgs.callPackage ./pkgs/downloader-cli {
            src = args.downloader-cli-src;
          };

          itunespy = pkgs.callPackage ./pkgs/itunespy { };

          youtube-search = pkgs.callPackage ./pkgs/youtube-search { };

          ytmdl = pkgs.callPackage ./pkgs/ytmdl {
            inherit itunespy simber pydes downloader-cli youtube-search;
            inherit (pkgs.python3Packages) buildPythonPackage fetchPypi;
            src = args.ytmdl-src;
          };
        };
      }
    );
}
