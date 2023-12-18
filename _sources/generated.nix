# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  awesome = {
    pname = "awesome";
    version = "375d9d723550023f75ff0066122aba99fdbb2a93";
    src = fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "375d9d723550023f75ff0066122aba99fdbb2a93";
      fetchSubmodules = false;
      sha256 = "sha256-9cIQvuXUPu8io2Qs3Q8n2WkF9OstdaGUt/+0FMrRkXk=";
    };
    date = "2023-11-19";
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
    version = "ef2e6898bd0a45db4252ddf1ae557f957d5a7792";
    src = fetchFromGitHub {
      owner = "lyonel";
      repo = "lshw";
      rev = "ef2e6898bd0a45db4252ddf1ae557f957d5a7792";
      fetchSubmodules = false;
      sha256 = "sha256-mTFt1LGPm3g5LBW5S7IanTnI2QGSnx93TUzc79f8E3E=";
    };
    date = "2023-11-15";
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
    version = "7366553be2b825495c5b1e09be09d0fabde4b9b4";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "7366553be2b825495c5b1e09be09d0fabde4b9b4";
      fetchSubmodules = false;
      sha256 = "sha256-MDDH4O0HW34UCY47Cj+RAV2AHOU54MO5LQQNoW4JTC8=";
    };
    date = "2023-12-17";
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
    version = "50ccd4c5b3cd700bed09d26eb75552f08f9af262";
    src = fetchgit {
      url = "https://github.com/riverwm/river.git";
      rev = "50ccd4c5b3cd700bed09d26eb75552f08f9af262";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-tacwctOL2TFiC8VP6ymoJ5QjQUFrG5H70J3HeOW/7/g=";
    };
    date = "2023-11-17";
  };
  stevenblack-blocklist = {
    pname = "stevenblack-blocklist";
    version = "885087bf64df37b10e936e88f0463dd5d6f8d7fa";
    src = fetchFromGitHub {
      owner = "stevenblack";
      repo = "hosts";
      rev = "885087bf64df37b10e936e88f0463dd5d6f8d7fa";
      fetchSubmodules = false;
      sha256 = "sha256-hTFIG1a/PNgDo5U57VmXDJvR3VWd8TKVinnLfJRlQGo=";
    };
    date = "2023-12-17";
  };
  wezterm = {
    pname = "wezterm";
    version = "e3cd2e93d0ee5f3af7f3fe0af86ffad0cf8c7ea8";
    src = fetchgit {
      url = "https://github.com/wez/wezterm.git";
      rev = "e3cd2e93d0ee5f3af7f3fe0af86ffad0cf8c7ea8";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-sj3S1fWC6j9Q/Yc+4IpLbKC3lttUWFk65ROyCdQt+Zc=";
    };
    date = "2023-12-03";
  };
}
