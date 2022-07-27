{ lib
, stdenv
, crane-lib
, runCommand
, src
, version
, dbus
, egl-wayland
, fontconfig
, freetype
, libGL
, libGLU
, libglvnd
, libX11
, libxcb
, libxkbcommon
, ncurses
, openssl
, perl
, pkg-config
, python3
, wayland
, xcbutil
, xcbutilimage
, xcbutilkeysyms
, xcbutilwm
, zlib
}:

let
  pname = "wezterm";

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
    inherit src pname nativeBuildInputs buildInputs;
  };
in
crane-lib.buildPackage rec {
  inherit src pname version cargoArtifacts nativeBuildInputs buildInputs;

  postInstall = ''
    mkdir -p $out/nix-support
    echo "${passthru.terminfo}" >> $out/nix-support/propagated-user-env-packages
    # desktop icon
    install -Dm644 assets/icon/terminal.png $out/share/icons/hicolor/128x128/apps/org.wezfurlong.wezterm.png
    install -Dm644 assets/wezterm.desktop $out/share/applications/org.wezfurlong.wezterm.desktop
    install -Dm644 assets/wezterm.appdata.xml $out/share/metainfo/org.wezfurlong.wezterm.appdata.xml
    # helper scripts
    install -Dm644 assets/shell-integration/wezterm.sh -t $out/etc/profile.d
  '';

  preFixup = lib.optionalString stdenv.isLinux ''
    patchelf --add-needed "${libGL}/lib/libEGL.so.1" $out/bin/wezterm-gui
  '';

  passthru.terminfo = runCommand "wezterm-terminfo"
    {
      nativeBuildInputs = [
        ncurses
      ];
    } ''
    mkdir -p $out/share/terminfo $out/nix-support
    tic -x -o $out/share/terminfo ${src}/termwiz/data/wezterm.terminfo
  '';

  doCheck = false;

  meta = with lib; {
    description = "A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust";
    homepage = "https://wezfurlong.org/wezterm";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ javacafe01 ];
  };
}
