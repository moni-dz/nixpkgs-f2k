{ self, ... }:

{
  imports = [
    ./applications.nix
    ./compositors.nix
    ./editors.nix
    ./fonts.nix
    ./misc.nix
    ./shells.nix
    ./stdenvs.nix
    ./terminal-emulators.nix
    ./themes.nix
    ./window-managers.nix
  ];

  flake.overlays = {
    darwin = final: prev: with self.overlays;
      (fonts final prev)
      // (editors final prev)
      // (misc final prev)
      // (terminal-emulators final prev)
      // (stdenvs final prev);

    linux = final: prev: with self.overlays;
      (applications final prev)
      // (compositors final prev)
      // (fonts final prev)
      // (terminal-emulators final prev)
      // (themes final prev)
      // (misc final prev)
      // (window-managers final prev)
      // (stdenvs final prev);

    default = self.overlays.linux;
  };
}
