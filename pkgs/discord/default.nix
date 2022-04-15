{ branch ? "stable", asar, electron, pkgs }:

let
  inherit (pkgs) callPackage fetchurl;
in
{
  stable = callPackage ./base.nix rec {
    pname = "discord-openasar";
    binaryName = "Discord";
    desktopName = "Discord";
    version = "0.0.17";
    inherit asar;
    inherit electron;

    src = fetchurl {
      url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
      sha256 = "0hdgif8jpp5pz2c8lxas88ix7mywghdf9c9fn95n0dwf8g1c1xbb";
    };
  };

  ptb = callPackage ./base.nix rec {
    pname = "discord-ptb-openasar";
    binaryName = "DiscordPTB";
    desktopName = "Discord PTB";
    version = "0.0.29";
    inherit asar;
    inherit electron;

    src = fetchurl {
      url = "https://dl-ptb.discordapp.net/apps/linux/${version}/discord-ptb-${version}.tar.gz";
      sha256 = "0r251g0dsj3p1pynp5h9a117105ib01i64w3mi45xxc2naaqspc9";
    };
  };

  canary = callPackage ./base.nix rec {
    pname = "discord-canary-openasar";
    binaryName = "DiscordCanary";
    desktopName = "Discord Canary";
    version = "0.0.134";
    inherit asar;
    inherit electron;

    src = fetchurl {
      url = "https://dl-canary.discordapp.net/apps/linux/${version}/discord-canary-${version}.tar.gz";
      sha256 = "0f54j7drzrlcabggncf0jciz6bfjxrfbapgzhy7z4yax6bh1kxv3";
    };
  };
}.${branch}
