# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub }:
{
  awesome = {
    pname = "awesome";
    version = "a436478731936812e82ef17b78cc4979d5db6ad6";
    src = fetchFromGitHub ({
      owner = "awesomeWM";
      repo = "awesome";
      rev = "a436478731936812e82ef17b78cc4979d5db6ad6";
      fetchSubmodules = false;
      sha256 = "sha256-zFeAzujjEGNBDmWIO/BS7mE6Dy4wsfINxsvcUx32nMg=";
    });
    date = "2022-10-22";
  };
  awesome-composite = {
    pname = "awesome-composite";
    version = "43a54e30cdbf247733ca68a88433f410af9c0a52";
    src = fetchFromGitHub ({
      owner = "xinhaoyuan";
      repo = "awesome";
      rev = "43a54e30cdbf247733ca68a88433f410af9c0a52";
      fetchSubmodules = false;
      sha256 = "sha256-NQbmEk9LqCa/bC5ORt2SdFWOsY6A+21udNEVPKnIXKs=";
    });
    date = "2022-10-09";
  };
  lshw = {
    pname = "lshw";
    version = "42fef565731411a784101de614a54bff79d1858e";
    src = fetchFromGitHub ({
      owner = "lyonel";
      repo = "lshw";
      rev = "42fef565731411a784101de614a54bff79d1858e";
      fetchSubmodules = false;
      sha256 = "sha256-Gt9RoTBCr1f5szmuRdrmQo9FNAflv+arq+KfFGP9b1E=";
    });
    date = "2022-08-31";
  };
  mpv-discord = {
    pname = "mpv-discord";
    version = "861bfe54f4b3a1538c475fcf8e4e1fea38039419";
    src = fetchFromGitHub ({
      owner = "tnychn";
      repo = "mpv-discord";
      rev = "861bfe54f4b3a1538c475fcf8e4e1fea38039419";
      fetchSubmodules = false;
      sha256 = "sha256-P1UaXGboOiqrXapfLzJI6IT3esNtflkQkcNXt4Umukc=";
    });
    date = "2022-02-21";
  };
  nvidia-exec = {
    pname = "nvidia-exec";
    version = "1dd1ecefe383cf115ba1680d5b1aa52b66ca9101";
    src = fetchFromGitHub ({
      owner = "pedro00dk";
      repo = "nvidia-exec";
      rev = "1dd1ecefe383cf115ba1680d5b1aa52b66ca9101";
      fetchSubmodules = false;
      sha256 = "sha256-UYl8XgIfWnRC1IYSX9ag8gTU9ENRDqoF2fBbuBRMb3o=";
    });
    date = "2022-06-17";
  };
  phocus = {
    pname = "phocus";
    version = "325d327242622d1f3090a126ba3d1e382853fb53";
    src = fetchFromGitHub ({
      owner = "phocus";
      repo = "gtk";
      rev = "325d327242622d1f3090a126ba3d1e382853fb53";
      fetchSubmodules = false;
      sha256 = "sha256-l+wS7Eugj55mYu6z6UUNVr9oxnq2B3oaYqNK99iPUgM=";
    });
    date = "2022-09-27";
  };
  picom = {
    pname = "picom";
    version = "2dae094981e665df37de523479be062d5e0bda98";
    src = fetchFromGitHub ({
      owner = "yshui";
      repo = "picom";
      rev = "2dae094981e665df37de523479be062d5e0bda98";
      fetchSubmodules = false;
      sha256 = "sha256-U3q45ES+pOn0RZPbzEB3CINMXKlRKJo0HwjiBnxK2kI=";
    });
    date = "2022-10-24";
  };
  picom-dccsillag = {
    pname = "picom-dccsillag";
    version = "51b21355696add83f39ccdb8dd82ff5009ba0ae5";
    src = fetchFromGitHub ({
      owner = "dccsillag";
      repo = "picom";
      rev = "51b21355696add83f39ccdb8dd82ff5009ba0ae5";
      fetchSubmodules = false;
      sha256 = "sha256-crCwRJd859DCIC0pEerpDqdX2j8ZrNAzVaSSB3mTPN8=";
    });
    date = "2022-05-29";
  };
  picom-pijulius = {
    pname = "picom-pijulius";
    version = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
    src = fetchFromGitHub ({
      owner = "pijulius";
      repo = "picom";
      rev = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
      fetchSubmodules = false;
      sha256 = "sha256-YiuLScDV9UfgI1MiYRtjgRkJ0VuA1TExATA2nJSJMhM=";
    });
    date = "2021-10-23";
  };
  stevenblack-blocklist = {
    pname = "stevenblack-blocklist";
    version = "cec39f13f5343ca8d4dc92d288f18d5a77d39a2a";
    src = fetchFromGitHub ({
      owner = "stevenblack";
      repo = "hosts";
      rev = "cec39f13f5343ca8d4dc92d288f18d5a77d39a2a";
      fetchSubmodules = false;
      sha256 = "sha256-2hFDC3KD17RyrO5wGnRtkRDtxrceVJFnA02/20RfRd0=";
    });
    date = "2022-10-20";
  };
}
