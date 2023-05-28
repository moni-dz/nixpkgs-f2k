# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  awesome = {
    pname = "awesome";
    version = "485661b706752212dac35e91bb24a0e16a677b70";
    src = fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "485661b706752212dac35e91bb24a0e16a677b70";
      fetchSubmodules = false;
      sha256 = "sha256-O0JqK0X8c9uj+c72ocN9i9sWiz1tvGHzN7t4WBQH504=";
    };
    date = "2023-05-18";
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
    version = "3aed5599c3f73cbfa53b0249795e76ab07cf9ecd";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "3aed5599c3f73cbfa53b0249795e76ab07cf9ecd";
      fetchSubmodules = false;
      sha256 = "sha256-XuQzOaR+9z6TNRwJ4sWVsLiD91bzKkXnapPdKjOxGo0=";
    };
    date = "2023-05-08";
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
    version = "792d94253c191e653e4025a648d574d9f8ce99bf";
    src = fetchgit {
      url = "https://github.com/riverwm/river.git";
      rev = "792d94253c191e653e4025a648d574d9f8ce99bf";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-4Gwi7PiITj6i41YnngecFWd/pt5UQwslOM71C7tUR4k=";
    };
    date = "2023-05-11";
  };
  stevenblack-blocklist = {
    pname = "stevenblack-blocklist";
    version = "bdc96809c82664310f26c07c675e6881e7738112";
    src = fetchFromGitHub {
      owner = "stevenblack";
      repo = "hosts";
      rev = "bdc96809c82664310f26c07c675e6881e7738112";
      fetchSubmodules = false;
      sha256 = "sha256-4EuJAQBGQnUbqdAJZFyq3MSZIC4r46tgVWiBeGJggjo=";
    };
    date = "2023-05-24";
  };
  wezterm = {
    pname = "wezterm";
    version = "05a2d6339832a62514dbb052cc36826d6e1ccc5f";
    src = fetchgit {
      url = "https://github.com/wez/wezterm.git";
      rev = "05a2d6339832a62514dbb052cc36826d6e1ccc5f";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-S6iBYyuT6CpAM+6dodLbGTBj1tOcwfGXh1T6ulXC1WQ=";
    };
    date = "2023-05-27";
  };
}
