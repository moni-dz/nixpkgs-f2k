{ dbus
, egl-wayland
, fontconfig
, freetype
, lib
, libGL
, libGLU
, libglvnd
, libX11
, libxcb
, libxkbcommon
, crane-lib
, openssl
, perl
, pkg-config
, python3
, rustPlatform
, src
, version
, wayland
, xcbutil
, xcbutilimage
, xcbutilkeysyms
, xcbutilwm
, zlib
, stdenv
}:

let
  nativeBuildInputs = [
    pkg-config
    python3
    perl
  ];

  buildInputs = [
    dbus
    egl-wayland
    fontconfig
    freetype
    libGL
    libGLU
    libglvnd
    libX11
    libxcb
    libxkbcommon
    openssl
    wayland
    xcbutil
    xcbutilimage
    xcbutilkeysyms
    xcbutilwm
    zlib
  ];

  cargoArtifacts = crane-lib.buildDepsOnly {
    pname = "wezterm-deps";
    inherit src nativeBuildInputs buildInputs;
  };
in
crane-lib.buildPackage {
  pname = "wezterm-git";

  inherit src version cargoArtifacts nativeBuildInputs buildInputs;

  preFixup = lib.optionalString stdenv.isLinux ''
    patchelf --add-needed "${libGL}/lib/libEGL.so.1" $out/bin/wezterm-gui
  '';

  doCheck = false;

  meta = with lib; {
    description =
      "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust";
    homepage = "https://wezfurlong.org/wezterm";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ javacafe01 ];
  };
}
