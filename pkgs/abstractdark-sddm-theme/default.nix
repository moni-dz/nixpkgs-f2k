{ lib, stdenv, src }:

stdenv.mkDerivation rec {
  pname = "abstractdark-sddm-theme";
  version = "unstable";

  inherit src;

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/sddm/themes/abstractdark-sddm-theme
    substituteInPlace theme.conf --replace 'Droid Sans Mono For Powerline' 'Sarasa Gothic J'
    mv * $out/share/sddm/themes/abstractdark-sddm-theme 
  '';

  meta = with lib; {
    description = "Abstract Dark theme for SDDM";
    homepage = "https://github.com/3ximus/abstractdark-sddm-theme";
    license = [ licenses.gpl3Only ];
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
