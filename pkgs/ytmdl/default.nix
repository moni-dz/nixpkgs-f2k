{ lib
, buildPythonPackage
, fetchPypi
, python3Packages
, simber
, pydes
, youtube-search
, downloader-cli
, itunespy
, src
}:

buildPythonPackage rec {
  pname = "ytmdl";
  version = "2021.3.4";

  inherit src;

  patches = [ ./use-beautifulsoup4.diff ];

  doCheck = false; # NOTE: disable to prevent false fails

  propagatedBuildInputs = with python3Packages; [
    simber
    pydes
    youtube-search
    colorama
    itunespy
    downloader-cli
    beautifulsoup4
    urllib3
    mutagen
    unidecode
    musicbrainzngs
    rich
    pysocks
    ffmpeg-python
    pyxdg
    lxml
    requests
    youtube-dl
    pycountry
  ];

  meta = with lib; {
    description =
      "A simple app to get songs from YouTube in mp3 format with artist name, album name etc from sources like iTunes, LastFM, Deezer, Gaana etc.";
    homepage = "https://github.com/deepjyoti30/ytmdl";
    license = licenses.mit;
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
