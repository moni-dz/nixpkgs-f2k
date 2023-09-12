# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  awesome = {
    pname = "awesome";
    version = "aa8c7c6e27a20fa265d3f06c5dc3fe72cc5f021e";
    src = fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "aa8c7c6e27a20fa265d3f06c5dc3fe72cc5f021e";
      fetchSubmodules = false;
      sha256 = "sha256-DGAImB4u8sRP9PEoZ4YXAxopa8eaJ7YJxSiBh36yfaE=";
    };
    date = "2023-08-30";
  };
  awesome-composite = {
    pname = "awesome-composite";
    version = "43a54e30cdbf247733ca68a88433f410af9c0a52";
    src = fetchFromGitHub {
      owner = "xinhaoyuan";
      repo = "awesome";
      rev = "43a54e30cdbf247733ca68a88433f410af9c0a52";
      fetchSubmodules = false;
      sha256 = "sha256-NQbmEk9LqCa/bC5ORt2SdFWOsY6A+21udNEVPKnIXKs=";
    };
    date = "2022-10-09";
  };
  lshw = {
    pname = "lshw";
    version = "b4e067307906ec6f277cce5c8a882f5edd03cbbc";
    src = fetchFromGitHub {
      owner = "lyonel";
      repo = "lshw";
      rev = "b4e067307906ec6f277cce5c8a882f5edd03cbbc";
      fetchSubmodules = false;
      sha256 = "sha256-ahdaQeYZEFCVxwAMJPMB9bfo3ndIiqFyM6OghXwtm1A=";
    };
    date = "2023-03-20";
  };
  mpv-discord = {
    pname = "mpv-discord";
    version = "861bfe54f4b3a1538c475fcf8e4e1fea38039419";
    src = fetchFromGitHub {
      owner = "tnychn";
      repo = "mpv-discord";
      rev = "861bfe54f4b3a1538c475fcf8e4e1fea38039419";
      fetchSubmodules = false;
      sha256 = "sha256-P1UaXGboOiqrXapfLzJI6IT3esNtflkQkcNXt4Umukc=";
    };
    date = "2022-02-21";
  };
  nvidia-exec = {
    pname = "nvidia-exec";
    version = "98003e6b7c0b9fdba5e91bc6d275848161172260";
    src = fetchFromGitHub {
      owner = "pedro00dk";
      repo = "nvidia-exec";
      rev = "98003e6b7c0b9fdba5e91bc6d275848161172260";
      fetchSubmodules = false;
      sha256 = "sha256-NXKEc7IfsuOoRoa2Z8AbodvahSs0DRqseQBsoO6BDec=";
    };
    date = "2023-09-01";
  };
  phocus = {
    pname = "phocus";
    version = "0cf0eb35a927bffcb797db8a074ce240823d92de";
    src = fetchFromGitHub {
      owner = "phocus";
      repo = "gtk";
      rev = "0cf0eb35a927bffcb797db8a074ce240823d92de";
      fetchSubmodules = false;
      sha256 = "sha256-URuoDJVRQ05S+u7mkz1EN5HWquhTC4OqY8MqAbl0crk=";
    };
    date = "2022-11-03";
  };
  picom = {
    pname = "picom";
    version = "d9e5795818bcc6afa93c1fd872ae5d2deecc6241";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "d9e5795818bcc6afa93c1fd872ae5d2deecc6241";
      fetchSubmodules = false;
      sha256 = "sha256-ddRt1JTa6lVNK8msfGUIXKyTuIa0i35no006eBOJByM=";
    };
    date = "2023-09-10";
  };
  picom-dccsillag = {
    pname = "picom-dccsillag";
    version = "51b21355696add83f39ccdb8dd82ff5009ba0ae5";
    src = fetchFromGitHub {
      owner = "dccsillag";
      repo = "picom";
      rev = "51b21355696add83f39ccdb8dd82ff5009ba0ae5";
      fetchSubmodules = false;
      sha256 = "sha256-crCwRJd859DCIC0pEerpDqdX2j8ZrNAzVaSSB3mTPN8=";
    };
    date = "2022-05-29";
  };
  picom-ft-labs = {
    pname = "picom-ft-labs";
    version = "e9834a5e350415d9e036d48304405bdb2d8a1567";
    src = fetchFromGitHub {
      owner = "FT-Labs";
      repo = "picom";
      rev = "e9834a5e350415d9e036d48304405bdb2d8a1567";
      fetchSubmodules = false;
      sha256 = "sha256-KX+/nO/nJlUjsZwVg2/vQy+byYmtnKbtxuhyiq/tWg8=";
    };
    date = "2023-04-25";
  };
  picom-pijulius = {
    pname = "picom-pijulius";
    version = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
    src = fetchFromGitHub {
      owner = "pijulius";
      repo = "picom";
      rev = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
      fetchSubmodules = false;
      sha256 = "sha256-YiuLScDV9UfgI1MiYRtjgRkJ0VuA1TExATA2nJSJMhM=";
    };
    date = "2021-10-23";
  };
  river = {
    pname = "river";
    version = "7f30c655c75568ae331ed0243578d91870f3f9c6";
    src = fetchgit {
      url = "https://github.com/riverwm/river.git";
      rev = "7f30c655c75568ae331ed0243578d91870f3f9c6";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-7cYLP2FID/DW4A06/Ujtqp2LE7NlHwaymQLiIA8xrMk=";
    };
    date = "2023-09-05";
  };
  stevenblack-blocklist = {
    pname = "stevenblack-blocklist";
    version = "1f745934590cc289fda9cd899a420b4d3ef2af30";
    src = fetchFromGitHub {
      owner = "stevenblack";
      repo = "hosts";
      rev = "1f745934590cc289fda9cd899a420b4d3ef2af30";
      fetchSubmodules = false;
      sha256 = "sha256-RSCXsrvKjocvx4SMA3nHY9qtc3cMYf1gGImWm1+stl8=";
    };
    date = "2023-09-10";
  };
  wezterm = {
    pname = "wezterm";
    version = "70931f58f1c7a57fd377f9862597e7b1fe070b52";
    src = fetchgit {
      url = "https://github.com/wez/wezterm.git";
      rev = "70931f58f1c7a57fd377f9862597e7b1fe070b52";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-MPwX1kGGo/bPlyWu8O+U0dohMpN0E89vuFAUOcHFACc=";
    };
    date = "2023-09-11";
  };
}
