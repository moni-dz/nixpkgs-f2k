{ getPackage, ... }:

{
  flake.overlays.fonts = _: prev: {
    iosevka-ft = prev.iosevka.override {
      privateBuildPlan = import ../pkgs/iosevka-ft/build-plan.nix;
      set = "ft";
    };

    iosevka-ft-qp = prev.iosevka.override {
      privateBuildPlan = import ../pkgs/iosevka-ft/build-plan-qp.nix;
      set = "ft-qp";
    };

    iosevka-ft-bin = prev.callPackage ../pkgs/iosevka-ft { };
    iosevka-ft-qp-bin = prev.callPackage ../pkgs/iosevka-ft { proportional = true; };
  };
}
