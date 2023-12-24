{ inputs, getPackage, ... }:

{
  flake.overlays.terminal-emulators = _: prev:
    let
      wez-pkg = getPackage "wezterm" prev;
    in
    {
      wezterm-git = prev.darwin.apple_sdk_11_0.callPackage "${inputs.nixpkgs}/pkgs/applications/terminal-emulators/wezterm" {
        inherit (prev.darwin.apple_sdk_11_0.frameworks) Cocoa CoreGraphics Foundation UserNotifications System;

        rustPlatform = prev.rustPlatform // {
          buildRustPackage = args: prev.rustPlatform.buildRustPackage (args // rec {
            inherit (wez-pkg) src;
            version = prev.lib.strings.substring 0 7 wez-pkg.version;
            cargoLock = {
              lockFile = "${src}/Cargo.lock";

              outputHashes = {
                "xcb-1.2.1" = "sha256-zkuW5ATix3WXBAj2hzum1MJ5JTX3+uVQ01R1vL6F1rY=";
                "xcb-imdkit-0.2.0" = "sha256-L+NKD0rsCk9bFABQF4FZi9YoqBHr4VAZeKAWgsaAegw=";
              };
            };
          });
        };
      };
    };
}
