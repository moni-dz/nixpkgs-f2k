# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  awesome = {
    pname = "awesome";
    version = "e6f5c7980862b7c3ec6c50c643b15ff2249310cc";
    src = fetchFromGitHub {
      owner = "awesomeWM";
      repo = "awesome";
      rev = "e6f5c7980862b7c3ec6c50c643b15ff2249310cc";
      fetchSubmodules = false;
      sha256 = "sha256-afviu5b86JDWd5F12Ag81JPTu9qbXi3fAlBp9tv58fI=";
    };
    date = "2024-01-20";
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
    version = "040cc107f858708eb238a4e2fe1ace334fe60868";
    src = fetchFromGitHub {
      owner = "yshui";
      repo = "picom";
      rev = "040cc107f858708eb238a4e2fe1ace334fe60868";
      fetchSubmodules = false;
      sha256 = "sha256-99MZ/sLfEV32LWbb+cCxZVouNYjmTP14de28KUEWCOQ=";
    };
    date = "2024-03-06";
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
    version = "ac655593f3113ca1d94d27c5845f0406bf495c9a";
    src = fetchgit {
      url = "https://github.com/riverwm/river.git";
      rev = "ac655593f3113ca1d94d27c5845f0406bf495c9a";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-hVt7FRJ04Z04406wnsvLhH8fRxzLa2RVFhzOM5pQSQo=";
    };
    date = "2024-03-09";
  };
  stevenblack-blocklist = {
    pname = "stevenblack-blocklist";
    version = "b382dcbebdd33ab21c2f08ca50fd21cf78a50536";
    src = fetchFromGitHub {
      owner = "stevenblack";
      repo = "hosts";
      rev = "b382dcbebdd33ab21c2f08ca50fd21cf78a50536";
      fetchSubmodules = false;
      sha256 = "sha256-Y612ASX0ks+GuUlVafcqAz8ikVvXx89qrxAY7N8Vaa0=";
    };
    date = "2024-03-09";
  };
  wezterm = {
    pname = "wezterm";
    version = "22424c3280cb21af43317cb58ef7bc34a8cbcc91";
    src = fetchgit {
      url = "https://github.com/wez/wezterm.git";
      rev = "22424c3280cb21af43317cb58ef7bc34a8cbcc91";
      fetchSubmodules = true;
      deepClone = false;
      leaveDotGit = false;
      sha256 = "sha256-EQb0gNAb98e4IFwBv5XODtq9Er519wM/h5EglD8Lrhc=";
    };
    date = "2024-02-26";
  };
}
