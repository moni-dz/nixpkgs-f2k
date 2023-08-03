{ inputs, getPackage, ... }:

{
  flake.overlays.terminal-emulators = _: prev: {
    wezterm-git =
      let
        package = getPackage "wezterm" prev;
      in
      prev.darwin.apple_sdk_11_0.callPackage ../pkgs/wezterm {
        inherit (prev.darwin.apple_sdk_11_0.frameworks) Cocoa CoreGraphics Foundation UserNotifications;
        inherit (package) src version;
        crane-lib = inputs.crane.lib.${prev.system}.overrideToolchain inputs.rust.packages.${prev.system}.rust_1_71_0;
      };
  };
}
