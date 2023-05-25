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
, CoreGraphics
, Cocoa
, Foundation
, libiconv
, UserNotifications
}:

let
  pname = "wezterm";

  nativeBuildInputs = [
    pkg-config
    python3
    ncurses
  ] ++ lib.optional stdenv.isDarwin perl;

  buildInputs = [
    fontconfig
    zlib
  ] ++ lib.optionals stdenv.isLinux [
    dbus
    egl-wayland
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
  ] ++ lib.optionals stdenv.isDarwin [
    Cocoa
    CoreGraphics
    Foundation
    libiconv
    UserNotifications
  ];

  cargoArtifacts = crane-lib.buildDepsOnly {
    inherit src pname version nativeBuildInputs buildInputs;
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
  '' + lib.optionalString stdenv.isDarwin ''
    mkdir -p "$out/Applications"
    OUT_APP="$out/Applications/WezTerm.app"
    cp -r assets/macos/WezTerm.app "$OUT_APP"
    rm $OUT_APP/*.dylib
    cp -r assets/shell-integration/* "$OUT_APP"
    ln -s $out/bin/{wezterm,wezterm-mux-server,wezterm-gui,strip-ansi-escapes} "$OUT_APP"
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
