{
  description = "fortuneteller2k's stash of fresh packages";

  inputs = {
    crane.url = "github:ipetkov/crane";
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    nixpkgs-fmt.url = "github:nix-community/nixpkgs-fmt";
    parts.url = "github:hercules-ci/flake-parts";
    emacs.url = "github:nix-community/emacs-overlay";

    # follows
    crane.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs-fmt.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, parts, ... }: parts.lib.mkFlake { inherit inputs; } {
    imports = [ ./overlays ];
    systems = [ "aarch64-darwin" "x86_64-darwin" "x86_64-linux" ];

    _module.args.getPackage = pname: pkgs: (pkgs.callPackage ./_sources/generated.nix { }).${pname};

    perSystem = { lib, system, ... }:
      let
        pkgs = import inputs.nixpkgs {
          inherit system;
          allowUnfree = true;
          allowUnsupportedSystem = true;
          overlays = [ self.overlays.default inputs.emacs.overlay ];
        };
      in
      {
        _module.args.pkgs = pkgs;

        packages =
          if lib.hasSuffix "darwin" system
          then builtins.removeAttrs (self.overlays.darwin pkgs pkgs) [ "lib" ]
          else builtins.removeAttrs (self.overlays.linux pkgs pkgs) [ "lib" ];

        formatter = inputs.nixpkgs-fmt.defaultPackage.${system};
      };

    flake = {
      nixosModules = {
        nvidia-exec = import ./modules/nvidia-exec.nix;
        stevenblack = import ./modules/stevenblack.nix;
      };
    };
  };
}
