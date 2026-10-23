{ getPackage, ... }:

{
  # If using as an overlay, you need emacs.overlay from nix-community/emacs-overlay
  flake.overlays.editors = _: prev: {
    emacs-plus-git = prev.emacs-git.overrideAttrs (fdrv: pdrv: {
      pname = "emacs-plus-git";
      name = "${fdrv.pname}-${pdrv.version}";

      # Taken from https://github.com/d12frosted/homebrew-emacs-plus/tree/master/patches/emacs-32
      patches = (pdrv.patches or [ ]) ++ [
        (prev.fetchpatch {
          url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-32/round-undecorated-frame.patch";
          hash = "sha256-5/XyOD2ter4syVDSKnIqR2nvqeMbtXy4SKvMZqmCums=";
        })

        (prev.fetchpatch {
          url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-31/system-appearance.patch";
          hash = "sha256-4+2U+4+2tpuaThNJfZOjy1JPnneGcsoge9r+WpgNDko=";
        })
      ];

      platforms = prev.lib.platforms.darwin;
    });
  };
}
