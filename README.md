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
  }
}
```

I also provide a `defaultPackage` attribute (default is `eww`), and a `packages` attribute if overlays aren't your thing.

## Non-flake enabled Nix, append to `configuration.nix`, or `home.nix`:
```nix
{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/fortuneteller2k/nixpkgs-f2k/archive/master.tar.gz;
    }))
  ];
}
```
