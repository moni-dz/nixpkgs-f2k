{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation (final: {
  pname = "man-pages-xnu";
  version = "8796.141.3";

  src = fetchurl {
    url = "https://github.com/apple-oss-distributions/xnu/archive/xnu-${final.version}.tar.gz";
    hash = "sha256-8Iv+BFoftVKmy/dFD+rmo13QA+mXnt9x6nfRqDbI3Jk=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share
    cp -r bsd/man $out/share
    runHook postInstall
  '';

  meta = with lib; {
    description = "XNU development manual pages";
    homepage = "https://opensource.apple.com";
    platforms = platforms.unix;
    license = licenses.apsl20;
  };
})
