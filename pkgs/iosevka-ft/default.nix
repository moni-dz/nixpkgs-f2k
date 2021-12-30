{ lib, fetchFromGitHub, proportional ? false }:

let
  version = "11.0.1";
in
fetchFromGitHub rec {
  name = "iosevka-ft${lib.optionalString proportional "-qp"}-bin-${version}";

  owner = "fortuneteller2k";
  repo = "iosevka-ft";
  rev = "1a025b46e4641082226645028c53cb023d3bf85e";
  sha256 = "sha256-gYu5Ija8zRc5THsEIAyYlPI2DbAR6jrx0crnX02oVMU=";

  postFetch = ''
    tar xzf $downloadedFile --strip=1
    mkdir -p $out/share/fonts/truetype
  ''
  +
  (if proportional then "install truetype-v11-quasi-proportional/*.ttf $out/share/fonts/truetype"
  else "install truetype-v11/*.ttf $out/share/fonts/truetype");

  meta = with lib; {
    description = "Custom build of Iosevka by fortuneteller2k";
    homepage = "https://github.com/fortuneteller2k/iosevka-ft";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
