{ getPackage, ... }:

{
  flake.overlays.misc = _: prev: {
    mpv-discord =
      let
        package = getPackage "mpv-discord" prev;
      in
      prev.callPackage ../pkgs/mpv-discord { inherit (package) src version; };

    mpv-discord-script =
      let
        package = getPackage "mpv-discord" prev;
      in
      prev.callPackage ../pkgs/mpv-discord/script.nix { inherit (package) src version; };

    stevenblack-blocklist-git = (getPackage "stevenblack-blocklist" prev).src;

    prowovider = prev.darwin.apple_sdk_11_0.callPackage ../pkgs/prowovider {
      inherit (prev.darwin.apple_sdk_11_0.frameworks) SystemConfiguration;
    };

    man-pages-xnu = prev.callPackage ../pkgs/man-pages-xnu { };

    geyser = prev.callPackage ../pkgs/geyser { };
  };
}
