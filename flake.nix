{
  description = "fortuneteller2k's stash of fresh packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    # NOTE: remove when meson has advanced to 0.59.1 in master
    meson059.url = "github:boppyt/nixpkgs/meson";
    rust-nightly.url = "github:oxalica/rust-overlay";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };
    flake-compat-ci.url = "github:hercules-ci/flake-compat-ci";

    ### Equivalent to multiple fetchFromGit[Hub/Lab] invocations
    # Themes
    abstractdark-sddm-theme-src = { url = "github:3ximus/abstractdark-sddm-theme"; flake = false; };

    # Programs
    alacritty-src = { url = "github:zenixls2/alacritty/ligature"; flake = false; };
    downloader-cli-src = { url = "github:deepjyoti30/downloader-cli"; flake = false; };
    slock-src = { url = "github:khuedoan/slock"; flake = false; };
    weechat-src = { url = "github:weechat/weechat"; flake = false; };
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
    sway-src = { url = "github:swaywm/sway"; flake = false; };
    wlroots-src = { url = "github:swaywm/wlroots"; flake = false; };
    xdpw-src = { url = "github:emersion/xdg-desktop-portal-wlr"; flake = false; };
  };

  outputs = args@{ self, flake-utils, nixpkgs, rust-nightly, meson059, ... }:
    {
      ciNix = args.flake-compat-ci.lib.recurseIntoFlake self;

      overlay = final: prev: {
        inherit (self.packages.${final.system})
          # Themes
          abstractdark-sddm-theme
          # Programs
          alacritty-ligatures
          pydes
          simber
          weechat-unwrapped-git
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
          sway-unwrapped-git
          wlroots-git
          xdg-desktop-portal-wlr-git
          # Fonts
          iosevka-ft-bin;

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

        version = "999-unstable";

        mesonPkgs = import meson059 { inherit system; };
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

          river-git = pkgs.river.overrideAttrs (_: rec {
            inherit version;
            src = args.river-src;
          });

          slock-fancy = pkgs.slock.overrideAttrs (_: rec {
            inherit version;
            src = args.slock-src;
            patches = [ ./patches/slock_patch.diff ];
          });

          sway-unwrapped-git = (pkgs.sway-unwrapped.overrideAttrs (_: {
            inherit version;
            src = args.sway-src;
          })).override {
            inherit (mesonPkgs) meson;
            wlroots = wlroots-git;
          };

          wlroots-git = (pkgs.wlroots.overrideAttrs (old: {
            inherit version;
            src = args.wlroots-src;

            buildInputs = (old.buildInputs or [ ]) ++ (with pkgs; [
              seatd
              vulkan-headers
              vulkan-loader
            ]);
          })).override {
            inherit (mesonPkgs) meson;
          };

          weechat-unwrapped-git = pkgs.weechat-unwrapped.overrideAttrs (_: {
            inherit version;
            src = args.weechat-src;
            patches = [ ];
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

          xdg-desktop-portal-wlr-git = pkgs.xdg-desktop-portal-wlr.overrideAttrs (_: {
            inherit version;
            src = args.xdpw-src;
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
