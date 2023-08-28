# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  awesome = {
    pname = "awesome";
    version = "28381d2792856419d4860dd6b9ed9b94b457c7f2";
    src = fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "28381d2792856419d4860dd6b9ed9b94b457c7f2";
      fetchSubmodules = false;
      sha256 = "sha256-p2cpQhKj/mhd8904MnjGbXf70cT/coG4XdIB5P/hvW4=";
    };
    date = "2023-08-17";
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
    version = "8cc5090a6c3b04db74f41d1108bd19d2592fa9ad";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "8cc5090a6c3b04db74f41d1108bd19d2592fa9ad";
      fetchSubmodules = false;
      sha256 = "sha256-Alri5KQ1ps5ZUN1lwGisDkZjU4v6u2yD2jgpZAY047Q=";
    };
    date = "2023-08-11";
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
    version = "45794444129b513be784397110bb04bcd0358e27";
    src = fetchFromGitHub {
      owner = "stevenblack";
      repo = "hosts";
      rev = "45794444129b513be784397110bb04bcd0358e27";
      fetchSubmodules = false;
      sha256 = "sha256-6KampMUXeX5fyF6RiyFsKFCRQjJ80ezXzpgK0DoCN1Y=";
    };
    date = "2023-08-27";
  };
  wezterm = {
    pname = "wezterm";
    version = "b53a385a39361379d3d7ac39a92e709db71c53b8";
    src = fetchgit {
      url = "https://github.com/wez/wezterm.git";
      rev = "b53a385a39361379d3d7ac39a92e709db71c53b8";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-UmEScr66ROlY9/dJqvjynWIR6F/h6YKbbSSTwUxIEbI=";
    };
    date = "2023-08-27";
  };
}
