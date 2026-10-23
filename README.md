# usage

**NOTE: these instructions aren't 100% what you should do, use accordingly to your configuration**

supported systems: `x86_64-linux`, `aarch64-linux`, `aarch64-darwin`

## non-flake configurations

enable `nix-command` and `flakes` **first** then rebuild with `nixos-rebuild switch`.

```nix
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
```

then append to `configuration.nix`, or `home.nix`:

```nix
{
  # using the overlays
  nixpkgs.overlays = [
    (builtins.getFlake "github:moni-dz/nixpkgs-f2k").overlays.default
  ];

  # for NixOS modules (do not use them in home.nix)
  imports = [ (builtins.getFlake "github:moni-dz/nixpkgs-f2k").nixosModules.stevenblack ];

  environment.systemPackages = [
    (builtins.getFlake "github:moni-dz/nixpkgs-f2k").packages.${pkgs.stdenv.hostPlatform.system}.iosevka-ft
  ];
}
```

## flake enabled nix

```nix
{
  inputs.nixpkgs-f2k.url = "github:moni-dz/nixpkgs-f2k";

  outputs = { self, nixpkgs-f2k, ... }@inputs: {
    nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # using the nixos modules provided
        nixpkgs-f2k.nixosModules.stevenblack # stevenblack hosts adblocking, refer to ./modules/stevenblack.nix for options

        # using the overlays (most likely you want)
        {
          nixpkgs.overlays = [
            # check flake.nix or clone and use `nix flake show` for available subsets of overlays

            nixpkgs-f2k.overlays.compositors # for X11 compositors
            nixpkgs-f2k.overlays.window-managers # window managers such as awesome
            nixpkgs-f2k.overlays.stdenvs # stdenvs with compiler optimizations, and library functions for optimizing them
            # nixpkgs-f2k.overlays.default # for all linux packages
            # nixpkgs-f2k.overlays.darwin # for all darwin packages (includes emacs-plus-git)
          ];
        }

        ./configuration.nix
      ];
    };
  };
}
```

## binary cache

```sh
cachix use fortuneteller2k
```

or if you're like me, and is doing it the manual approach

```nix
{
  nix.settings.substituters = [
    "https://cache.nixos.org?priority=10"
    "https://fortuneteller2k.cachix.org"
  ];

  nix.settings.trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "fortuneteller2k.cachix.org-1:kXXNkMV5yheEQwT0I4XYh1MaCSz+qg72k8XAi2PthJI="
  ];
}
```

## making your own copy

instead of forking, click the "Use this template" button
