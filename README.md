# Usage

**NOTE: these instructions aren't 100% what you should do, use accordingly to your configuration**

## Flake enabled Nix:

```nix
{
  inputs.nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";

  outputs = { self, nixpkgs-f2k, ... }@inputs: {
    nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        { nixpkgs.overlays = [ nixpkgs-f2k.overlay ]; }
        ./configuration.nix
      ];
    };
  };
}
```

I also provide a `defaultPackage` attribute (default is `eww`), and a `packages` attribute if overlays aren't your thing.

## Non-flake configurations, enable flakes then append to `configuration.nix`, or `home.nix`:
```nix
{
  nixpkgs.overlays = [
    (builtins.getFlake "github:fortuneteller2k/nixpkgs-f2k").overlay
  ];
}
```

Enabling `nix-command` and `flakes`

```nix
{
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}
```



## Binary Cache

```sh
cachix use fortuneteller2k
```

or if you're like me, and is doing it the manual approach

```nix
{
  # Older versions use `nix.binaryCaches`
  nix.settings.substituters = [
    "https://cache.nixos.org?priority=10"
    "https://fortuneteller2k.cachix.org"
  ];

  # Older versions use `nix.binaryCachePublicKeys`
  nix.settings.trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    "fortuneteller2k.cachix.org-1:kXXNkMV5yheEQwT0I4XYh1MaCSz+qg72k8XAi2PthJI="
  ];
}
```
