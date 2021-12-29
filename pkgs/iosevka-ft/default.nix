{ lib, fetchFromGitHub }:

let
  version = "11.0.1";
in
fetchFromGitHub rec {
  name = "iosevka-ft-bin-${version}";

  owner = "fortuneteller2k";
  repo = "iosevka-ft";
  rev = "b578b0216ffacede8438490c17eda33d23929e4b";
  sha256 = "sha256-AFmHOYCEusjZbpg9hsNsF9jGvl5NVBWA3Y4uztXCB20=";

  postFetch = ''
    tar xzf $downloadedFile --strip=1
    mkdir -p $out/share/fonts/truetype
    install truetype-v11/*.ttf $out/share/fonts/truetype
  '';

  meta = with lib; {
    description = "Custom build of Iosevka by fortuneteller2k";
    homepage = "https://github.com/fortuneteller2k/iosevka-ft";
    license = licenses.ofl;
    platforms = platforms.all;
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
