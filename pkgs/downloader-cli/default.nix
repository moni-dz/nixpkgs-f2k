{ lib, python3Packages, buildPythonPackage, urllib3, src }:

buildPythonPackage rec {
  pname = "downloader-cli";
  version = "0.2.0";

  inherit src;

  buildInputs = [ urllib3 ];

  meta = with lib; {
    description = "A simple downloader written in Python with an awesome customizable progressbar";
    homepage = "https://github.com/deepjyoti30/downloader-cli";
    license = licenses.mit;
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
