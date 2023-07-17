# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  awesome = {
    pname = "awesome";
    version = "0e5fc4575ab0adbae75908cb49937d9cf63437ec";
    src = fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "0e5fc4575ab0adbae75908cb49937d9cf63437ec";
      fetchSubmodules = false;
      sha256 = "sha256-ZFjYKyzQiRgg5uHgMLeex6oOKDrXMhp9dxxHEm2xeH4=";
    };
    date = "2023-06-14";
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
    version = "9b125cd1d360b48d1f0c1be5fa939e56c71913d3";
    src = fetchFromGitHub {
      owner = "pedro00dk";
      repo = "nvidia-exec";
      rev = "9b125cd1d360b48d1f0c1be5fa939e56c71913d3";
      fetchSubmodules = false;
      sha256 = "sha256-pR7+FTedDlYKky/AxTlR4ayLqeIbCq68bjBklClrhBY=";
    };
    date = "2023-03-12";
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
    version = "5c03f101f26efba62adb9169463a973910cf1762";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "5c03f101f26efba62adb9169463a973910cf1762";
      fetchSubmodules = false;
      sha256 = "sha256-/Fu4GX6f3oiCvBS9ogi9i+a7DimjPiBEceOwCot119k=";
    };
    date = "2023-07-16";
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
    version = "c16628c7f57c51d50f2d10a96c265fb0afaddb02";
    src = fetchgit {
      url = "https://github.com/riverwm/river.git";
      rev = "c16628c7f57c51d50f2d10a96c265fb0afaddb02";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-E3Xtv7JeCmafiNmpuS5VuLgh1TDAbibPtMo6A9Pz6EQ=";
    };
    date = "2023-07-11";
  };
  stevenblack-blocklist = {
    pname = "stevenblack-blocklist";
    version = "fa33288ca366cfded8dba4c9e9360858c19ddfb2";
    src = fetchFromGitHub {
      owner = "stevenblack";
      repo = "hosts";
      rev = "fa33288ca366cfded8dba4c9e9360858c19ddfb2";
      fetchSubmodules = false;
      sha256 = "sha256-wKVdNG3Uj1CdP35GDmRi7mIAGRJCWDzgwxC5Vd77XrA=";
    };
    date = "2023-07-15";
  };
  wezterm = {
    pname = "wezterm";
    version = "7214470073e6bca4a9c0f140e7437d13fab802cd";
    src = fetchgit {
      url = "https://github.com/wez/wezterm.git";
      rev = "7214470073e6bca4a9c0f140e7437d13fab802cd";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-y4RjFsc8zI6bxcxnWkGDq+80c4ZOL7s/8ws7IQ4qK2g=";
    };
    date = "2023-07-16";
  };
}
