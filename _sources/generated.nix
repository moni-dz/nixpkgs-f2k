# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  awesome = {
    pname = "awesome";
    version = "8b1f8958b46b3e75618bc822d512bb4d449a89aa";
    src = fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "8b1f8958b46b3e75618bc822d512bb4d449a89aa";
      fetchSubmodules = false;
      sha256 = "sha256-ZGZ53IWfQfNU8q/hKexFpb/2mJyqtK5M9t9HrXoEJCg=";
    };
    date = "2024-03-23";
  };
  awesome-composite = {
    pname = "awesome-composite";
    version = "9a9b853a85d353b32a293414488807ffb9c33fa5";
    src = fetchFromGitHub {
      owner = "xinhaoyuan";
      repo = "awesome";
      rev = "9a9b853a85d353b32a293414488807ffb9c33fa5";
      fetchSubmodules = false;
      sha256 = "sha256-ilaoQs0HeSSoHzcgbPPbf7hsBsaVfjcnPaG1XA19G/Q=";
    };
    date = "2024-02-11";
  };
  lshw = {
    pname = "lshw";
    version = "15e4ca64647ad119b69be63274e5de2696d3934f";
    src = fetchFromGitHub {
      owner = "lyonel";
      repo = "lshw";
      rev = "15e4ca64647ad119b69be63274e5de2696d3934f";
      fetchSubmodules = false;
      sha256 = "sha256-kHuWfKmifTwlvvLk0FtZzeI4UMleoJ7LDsQHO076l84=";
    };
    date = "2024-01-06";
  };
  mpv-discord = {
    pname = "mpv-discord";
    version = "65bed810bfb7f086a9e4e17d2370ada833a7b9da";
    src = fetchFromGitHub {
      owner = "tnychn";
      repo = "mpv-discord";
      rev = "65bed810bfb7f086a9e4e17d2370ada833a7b9da";
      fetchSubmodules = false;
      sha256 = "sha256-OFbNUHnKko9GoO5GPf9LheJTbgCUYqBt4u3p+ezDmxI=";
    };
    date = "2024-03-28";
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
    version = "d77ea2472d59c134c7748818f72ad26b6ef9c026";
    src = fetchFromGitHub {
      owner = "phocus";
      repo = "gtk";
      rev = "d77ea2472d59c134c7748818f72ad26b6ef9c026";
      fetchSubmodules = false;
      sha256 = "sha256-RvqcjJmz354ukKJhgYP/A5Dn1urt20L+LKbRk0C8Nhs=";
    };
    date = "2024-01-12";
  };
  picom = {
    pname = "picom";
    version = "2052bc70c32ce11fb534f6b2531d3d826101b9b3";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "2052bc70c32ce11fb534f6b2531d3d826101b9b3";
      fetchSubmodules = false;
      sha256 = "sha256-FJf+lO9cNiGY0UncAfOiQnH1xH8NC+bpi2kqB7rCC60=";
    };
    date = "2024-04-29";
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
    version = "e7b14886ae644aaa657383f7c4f44be7797fd5f6";
    src = fetchFromGitHub {
      owner = "pijulius";
      repo = "picom";
      rev = "e7b14886ae644aaa657383f7c4f44be7797fd5f6";
      fetchSubmodules = false;
      sha256 = "sha256-YQVp5HicO+jbvCYSY+hjDTnXCU6aS3aCvbux6NFcJ/Y=";
    };
    date = "2024-04-30";
  };
  river = {
    pname = "river";
    version = "5262a4c5a61f547acd29560f1af9cf342b9958ae";
    src = fetchgit {
      url = "https://github.com/riverwm/river.git";
      rev = "5262a4c5a61f547acd29560f1af9cf342b9958ae";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-MAQ4FRzkGrO2oHWU6VlnHpGQE8855Goq5SdjV46+yek=";
    };
    date = "2024-04-24";
  };
  stevenblack-blocklist = {
    pname = "stevenblack-blocklist";
    version = "4b623fad8ac7d34991289c224b0dee6e7d146161";
    src = fetchFromGitHub {
      owner = "stevenblack";
      repo = "hosts";
      rev = "4b623fad8ac7d34991289c224b0dee6e7d146161";
      fetchSubmodules = false;
      sha256 = "sha256-zrfbNR6UyWWkyIVsI9l5qFC1Dg02jVoLD1gohG9HVNQ=";
    };
    date = "2024-04-30";
  };
  wezterm = {
    pname = "wezterm";
    version = "0184e88e97b6521df613df4ccdb2e896ce8b0ad0";
    src = fetchgit {
      url = "https://github.com/wez/wezterm.git";
      rev = "0184e88e97b6521df613df4ccdb2e896ce8b0ad0";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-exVTh69NeBloqNN1YS2B3tsOcSlGhHOMUaWn4/HciQ4=";
    };
    date = "2024-04-29";
  };
}
