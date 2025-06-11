{ getPackage, ... }:

{
  # If using as an overlay, you need emacs.overlay from nix-community/emacs-overlay
  flake.overlays.editors = _: prev: {
    emacs-plus-git = prev.emacs-git.overrideAttrs (fdrv: pdrv: {
      pname = "emacs-plus-git";
      name = "${fdrv.pname}-${pdrv.version}";

      # Taken from https://github.com/d12frosted/homebrew-emacs-plus/tree/master/patches/emacs-30
      patches = (pdrv.patches or [ ]) ++ [
        (prev.fetchpatch {
          url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-29/poll.patch";
          hash = "sha256-jN9MlD8/ZrnLuP2/HUXXEVVd6A+aRZNYFdZF8ReJGfY=";
        })

        (prev.fetchpatch {
          url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-30/round-undecorated-frame.patch";
          hash = "sha256-uYIxNTyfbprx5mCqMNFVrBcLeo+8e21qmBE3lpcnd+4=";
        })

        (prev.fetchpatch {
          url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/fix-window-role.patch";
          hash = "sha256-+z/KfsBm1lvZTZNiMbxzXQGRTjkCFO4QPlEK35upjsE=";
        })

        (prev.fetchpatch {
          url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/no-frame-refocus-cocoa.patch";
          hash = "sha256-QLGplGoRpM4qgrIAJIbVJJsa4xj34axwT3LiWt++j/c=";
        })

        (prev.fetchpatch {
          url = "https://raw.githubusercontent.com/d12frosted/homebrew-emacs-plus/master/patches/emacs-28/system-appearance.patch";
          hash = "sha256-oM6fXdXCWVcBnNrzXmF0ZMdp8j0pzkLE66WteeCutv8=";
        })
      ];

      platforms = prev.lib.platforms.darwin;
    });
  };
}
