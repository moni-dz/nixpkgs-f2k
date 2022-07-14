{ lib, stdenvNoCC, src, version, makeWrapper, jq, lshw, lsof }:

stdenvNoCC.mkDerivation {
  pname = "nvidia-exec";
  inherit src version;
  nativeBuildInputs = [ makeWrapper ];
  dontBuild = true;

  installPhase = ''
    install -Dm755 -t $out/bin nvx
  '';

  preFixup = ''
    wrapProgram $out/bin/nvx --prefix PATH : ${lib.makeBinPath [ jq lshw lsof ]}
  '';

  meta = with lib; {
    homepage = "https://github.com/pedro00dk/nvidia-exec";
    description = "A script to run programs on nvidia optimus setups with power management.";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    mainProgram = "nvx";
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
