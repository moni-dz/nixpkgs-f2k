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
    version = "5df19aed2030c37395bc58fe71b12452d85b3cbe";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "5df19aed2030c37395bc58fe71b12452d85b3cbe";
      fetchSubmodules = false;
      sha256 = "sha256-09g2l/I6EGLFqPpgsaEsj2tjDOP5dyzK5mgPJVWJY4c=";
    };
    date = "2024-03-24";
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
    version = "974cd7645b29c4dee600895518c06901847552ef";
    src = fetchFromGitHub {
      owner = "pijulius";
      repo = "picom";
      rev = "974cd7645b29c4dee600895518c06901847552ef";
      fetchSubmodules = false;
      sha256 = "sha256-dnuwX15kYCI3vxi3AEd/6012YWYKuvviOZmLbqzj/4s=";
    };
    date = "2024-03-21";
  };
  river = {
    pname = "river";
    version = "12de175e115f08d1a77b438910ba6dc58a3d80af";
    src = fetchgit {
      url = "https://github.com/riverwm/river.git";
      rev = "12de175e115f08d1a77b438910ba6dc58a3d80af";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-i+5wQkGsiyN/LaGfuj306tdiv+7vcbgahL9JvscM4iw=";
    };
    date = "2024-03-24";
  };
  stevenblack-blocklist = {
    pname = "stevenblack-blocklist";
    version = "3e12f3989b1ddaa846bf895f64e6978e7183f9bc";
    src = fetchFromGitHub {
      owner = "stevenblack";
      repo = "hosts";
      rev = "3e12f3989b1ddaa846bf895f64e6978e7183f9bc";
      fetchSubmodules = false;
      sha256 = "sha256-0keQEhEe2OWbjmkXODM2NxB/AHimD6MjxIr8n8gj+Qw=";
    };
    date = "2024-03-23";
  };
  wezterm = {
    pname = "wezterm";
    version = "889f8a9cd71a2b3552f28f6d1864aa3cd9461fdf";
    src = fetchgit {
      url = "https://github.com/wez/wezterm.git";
      rev = "889f8a9cd71a2b3552f28f6d1864aa3cd9461fdf";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-H8c7oSJufX2AEgcBk7eMrlFw+x0SgI9vI4iKlNojvMk=";
    };
    date = "2024-03-16";
  };
}
