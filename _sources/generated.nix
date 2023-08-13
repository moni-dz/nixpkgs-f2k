# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  awesome = {
    pname = "awesome";
    version = "ed71b17f1bed57b837377f77f7a895e7ee834f89";
    src = fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "ed71b17f1bed57b837377f77f7a895e7ee834f89";
      fetchSubmodules = false;
      sha256 = "sha256-xstRramPwHma3gZrWNR6La3dccMBRykK+oLZWfakirE=";
    };
    date = "2023-08-12";
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
    version = "7ecb84e53b2a4d1e439a4fafb367ea1a45ca7808";
    src = fetchFromGitHub {
      owner = "stevenblack";
      repo = "hosts";
      rev = "7ecb84e53b2a4d1e439a4fafb367ea1a45ca7808";
      fetchSubmodules = false;
      sha256 = "sha256-4d05pGZ8D90JL5zD9KKT4dPb3T12aYoP/69J9mVYn+M=";
    };
    date = "2023-08-10";
  };
  wezterm = {
    pname = "wezterm";
    version = "bf1726343131f0dae4eb5d2dd7e6b15e3e6754fc";
    src = fetchgit {
      url = "https://github.com/wez/wezterm.git";
      rev = "bf1726343131f0dae4eb5d2dd7e6b15e3e6754fc";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-sG7uj2qnSzwLLKc/S92exRd5k/g2JLzHumCJQEvnsW0=";
    };
    date = "2023-08-06";
  };
}
