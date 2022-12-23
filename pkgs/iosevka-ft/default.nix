{ lib, fetchurl, proportional ? false }:

let
  version = "11.0.1";
in
fetchurl rec {
  name = "iosevka-ft${lib.optionalString proportional "-qp"}-bin-${version}";

  url = "https://github.com/fortuneteller2k/iosevka-ft/archive/refs/tags/zip.tar.gz";

  downloadToTemp = true;
  recursiveHash = true;

  sha256 =
    if proportional then
      "sha256-vjXFdxxrYhLMA2vqqBhFJ9UdwvgFxvlWw2q5ZPM6qH0="
    else
      "sha256-AFmHOYCEusjZbpg9hsNsF9jGvl5NVBWA3Y4uztXCB20=";

  postFetch = ''
    tar xf $downloadedFile
    mkdir -p $out/share/fonts/truetype
    cd iosevka-ft-zip
  ''
  +
  (if proportional then "install -t $out/share/fonts/truetype truetype-v11-quasi-proportional/*.ttf"
  else "install -t $out/share/fonts/truetype truetype-v11/*.ttf");

  meta = with lib; {
    description = "Custom build of Iosevka by fortuneteller2k";
    homepage = "https://github.com/fortuneteller2k/iosevka-ft";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
