{
  description = "fortuneteller2k's stash of fresh packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    nixpkgs-fmt.url = "github:nix-community/nixpkgs-fmt";
    parts.url = "github:hercules-ci/flake-parts";
    emacs.url = "github:nix-community/emacs-overlay";

    # follows
    nixpkgs-fmt.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, parts, ... }: parts.lib.mkFlake { inherit inputs; } {
    imports = [ ./overlays ];
    systems = [ "aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux" ];

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
          then removeAttrs (self.overlays.darwin pkgs pkgs) [ "lib" ]
          else removeAttrs (self.overlays.linux pkgs pkgs) [ "lib" ];

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
