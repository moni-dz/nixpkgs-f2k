# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  awesome = {
    pname = "awesome";
    version = "ee0663459922a41f57fa2cc936da80d5857eedc9";
    src = fetchFromGitHub ({
      owner = "awesomeWM";
      repo = "awesome";
      rev = "ee0663459922a41f57fa2cc936da80d5857eedc9";
      fetchSubmodules = false;
      sha256 = "sha256-K9qOOdzo/KEcEb6DJ1Q1W6sqarbDAQ3cm7Oa6pbikHI=";
    });
    date = "2022-12-18";
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
    version = "0cf0eb35a927bffcb797db8a074ce240823d92de";
    src = fetchFromGitHub ({
      owner = "phocus";
      repo = "gtk";
      rev = "0cf0eb35a927bffcb797db8a074ce240823d92de";
      fetchSubmodules = false;
      sha256 = "sha256-URuoDJVRQ05S+u7mkz1EN5HWquhTC4OqY8MqAbl0crk=";
    });
    date = "2022-11-03";
  };
  picom = {
    pname = "picom";
    version = "60ac2b64db78363fe04189cc734daea3d721d87e";
    src = fetchFromGitHub ({
      owner = "yshui";
      repo = "picom";
      rev = "60ac2b64db78363fe04189cc734daea3d721d87e";
      fetchSubmodules = false;
      sha256 = "sha256-DcTnulkhWPMqGDLD7V17f9Lxs4i44/H26gHo+dmbSCc=";
    });
    date = "2022-12-23";
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
    version = "d2cbb55e2a4285a54def176c9109406f8811a30f";
    src = fetchFromGitHub ({
      owner = "stevenblack";
      repo = "hosts";
      rev = "d2cbb55e2a4285a54def176c9109406f8811a30f";
      fetchSubmodules = false;
      sha256 = "sha256-B0WNomIFxNmLjZzepjLA3QIU+LfE2PtbXvx6Z57OZVg=";
    });
    date = "2022-12-20";
  };
}
