{ lib
, stdenv
, fetchFromGitHub
, src
, version
, pkg-config
, cmake
, ninja
, libdrm
, libinput
, libxcb
, libxkbcommon
, mesa
, mount
, pango
, wayland
, wayland-protocols
, wayland-scanner
, wlroots
, xcbutilwm
}:

stdenv.mkDerivation {
  pname = "hyprland";
  inherit src version;

  nativeBuildInputs = [
    pkg-config
    wayland
    cmake
    ninja
  ];

  buildInputs = [
    libdrm
    libinput
    libxcb
    libxkbcommon
    mesa
    pango
    wayland-protocols
    wayland-scanner
    wlroots
    xcbutilwm
  ];

  dontBuild = true;
  dontInstall = true;

  patches = [ ./fix-makefile.diff ];

  postPatch = ''
    mkdir -p $out/bin
    make install PREFIX=$out
  '';

  meta = with lib; {
    homepage = "https://github.com/vaxerski/Hyprland";
    description = "A dynamic tiling Wayland compositor that doesn't sacrifice on its looks";
    license = licenses.bsd3;
    platforms = platforms.linux;
  };
}