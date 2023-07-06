# Usage

**NOTE: these instructions aren't 100% what you should do, use accordingly to your configuration**

# Non-flake configurations, enable flakes then append to `configuration.nix`, or `home.nix`:

Enable `nix-command` and `flakes` **first** then rebuild with `nixos-rebuild switch`.

```nix
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # for older versions
  /*
    nix.extraOptions = ''
      experimental-features = nix-command flakes
    '';
  */
}
```

then after:

```nix
{
  # using the overlays
  nixpkgs.overlays = [
    (__getFlake "github:fortuneteller2k/nixpkgs-f2k").overlays.default
  ];

  # for NixOS modules (do not use them in home.nix)
  imports = [ (__getFlake "github:fortuneteller2k/nixpkgs-f2k").nixosModules.stevenblack ];
  
  environment.systemPackages = with pkgs; [
    (__getFlake "github:fortuneteller2k/nixpkgs-f2k").packages.${system}.wezterm-git
  ];
}
```


## Flake enabled Nix:

```nix
{
  inputs.nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";

  outputs = { self, nixpkgs-f2k, ... }@inputs: {
    nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # using the nixos modules provided
	nixpkgs-f2k.nixosModules.stevenblack # stevenblack hosts adblocking, refer to ./modules/stevenblack.nix for options

	# using the overlays (most likely you want)
	{
	  nixpkgs.overlays = [
	    # Check flake.nix or clone and use `nix flake show` for available subsets of overlays

	    nixpkgs-f2k.overlays.compositors # for X11 compositors
	    nixpkgs-f2k.overlays.window-managers # window managers such as awesome or river
	    nixpkgs-f2k.overlays.stdenvs # stdenvs with compiler optimizations, and library functions for optimizing them
	    # nixpkgs-f2k.overlays.default # for all packages
	  ];
	}

        ./configuration.nix
      ];
    };
  };
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

## making your own copy

instead of forking, click the "Use this template" button
