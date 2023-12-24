{ lib, stdenvNoCC, fetchurl, jre, makeBinaryWrapper }:

stdenvNoCC.mkDerivation {
  pname = "geyser";
  version = "340";

  src = fetchurl {
    url = "https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone";
    hash = "sha256-QInbB9By7sgvGrLbpBieT8wKt7b09jWtkJWvzhtOWgM=";
  };

  installPhase = ''
    runHook preInstall

    install -D $src $out/share/geyser/geyser.jar

    makeWrapper ${lib.getExe jre} "$out/bin/geyser" \
      --append-flags "-jar $out/share/geyser/geyser.jar nogui"

    runHook postInstall
  '';

  nativeBuildInputs = [
    makeBinaryWrapper
  ];

  dontUnpack = true;
  preferLocalBuild = true;
  allowSubstitutes = false;

  meta = {
    description = "Enable clients from Minecraft Bedrock Edition to join your Minecraft Java server";
    homepage = "https://geysermc.org/";
    sourceProvenance = with lib.sourceTypes; [ binaryBytecode ];
    license = lib.licenses.mit;
    platforms = lib.platforms.unix;
    mainProgram = "geyser";
  };
}
