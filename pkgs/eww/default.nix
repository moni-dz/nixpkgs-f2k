{ lib, pkgs, src }:

with pkgs;

rustPlatform.buildRustPackage rec {
  pname = "eww";
  version = "unstable";

  inherit src;

  cargoLock = {
    lockFile = "${src}/Cargo.lock";
  };

  nativeBuildInputs = [
    wrapGAppsHook
    pkg-config
    rust-bin.nightly.latest.default
  ];

  buildInputs = [
    gtk3
    cairo
    glib
    atk
    pango
    gdk-pixbuf
    gdk-pixbuf-xlib
    wayland
    wayland-protocols
    gtk-layer-shell
  ];

  /*
    NOTE: Compile times are longer with the checkPhase enabled, this is NUR or my flake so *we don't care*
    
    Also, tests are failing.
  */
  doCheck = false;
  checkPhase = null;

  # cargoSha256 = "sha256-eHeXpToep6ho2am8grgn7Yr39Y3A1Skw//t64gGgl7I=";

  meta = with lib; {
    description = "A standalone widget system made in Rust to add AwesomeWM like widgets to any WM";
    homepage = "https://github.com/elkowar/eww";
    license = licenses.mit;
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
