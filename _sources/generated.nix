# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  awesome = {
    pname = "awesome";
    version = "7ed4dd620bc73ba87a1f88e6f126aed348f94458";
    src = fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "7ed4dd620bc73ba87a1f88e6f126aed348f94458";
      fetchSubmodules = false;
      sha256 = "sha256-o69if8HQw2u0fp5J7jkS4WQeAXVuiFwpDLzGFscP4mM=";
    };
    date = "2023-10-12";
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
    version = "a6b4e285f833c13b217c0e30ca71a903ec2464b5";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "a6b4e285f833c13b217c0e30ca71a903ec2464b5";
      fetchSubmodules = false;
      sha256 = "sha256-l76TyxuBjHhIHG1FWzgdAy2obELdVdgtCkdGrfXTK44=";
    };
    date = "2023-10-17";
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
    version = "5da4769c2357072771e89f00bdd68098b2ef3660";
    src = fetchgit {
      url = "https://github.com/riverwm/river.git";
      rev = "5da4769c2357072771e89f00bdd68098b2ef3660";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-TLT3tRrPmWGisPMxiL4Sfu5p9QtBLM9MBlX1N/h3cWc=";
    };
    date = "2023-10-26";
  };
  stevenblack-blocklist = {
    pname = "stevenblack-blocklist";
    version = "b05eca9505722abe416b46fd4eb55dda7443da7e";
    src = fetchFromGitHub {
      owner = "stevenblack";
      repo = "hosts";
      rev = "b05eca9505722abe416b46fd4eb55dda7443da7e";
      fetchSubmodules = false;
      sha256 = "sha256-H5odKLF7WXXJ0sX6EgesoeGgV3L5sJW5qpg5SkLCJ3E=";
    };
    date = "2023-10-27";
  };
  wezterm = {
    pname = "wezterm";
    version = "fec90ae04bf448d4b1475ba1d0ba1392846a70d6";
    src = fetchgit {
      url = "https://github.com/wez/wezterm.git";
      rev = "fec90ae04bf448d4b1475ba1d0ba1392846a70d6";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-7eMeNdmo8vpSnoPamShdLSTAUcK/mCiEpL30t+5spvc=";
    };
    date = "2023-10-17";
  };
}
