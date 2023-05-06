# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub, dockerTools }:
{
  awesome = {
    pname = "awesome";
    version = "6f000aad2a38a79d6c9b078df514ad6f2b58802f";
    src = fetchFromGitHub ({
      owner = "awesomeWM";
      repo = "awesome";
      rev = "6f000aad2a38a79d6c9b078df514ad6f2b58802f";
      fetchSubmodules = false;
      sha256 = "sha256-rIkXgTXT81DN0LJsUfSZzM0ENAstwxKwbSMFMqGSh1U=";
    });
    date = "2023-05-03";
  };
  awesome-composite = {
    pname = "awesome-composite";
    version = "43a54e30cdbf247733ca68a88433f410af9c0a52";
    src = fetchFromGitHub ({
      owner = "xinhaoyuan";
      repo = "awesome";
      rev = "43a54e30cdbf247733ca68a88433f410af9c0a52";
      fetchSubmodules = false;
      sha256 = "sha256-NQbmEk9LqCa/bC5ORt2SdFWOsY6A+21udNEVPKnIXKs=";
    });
    date = "2022-10-09";
  };
  lshw = {
    pname = "lshw";
    version = "b4e067307906ec6f277cce5c8a882f5edd03cbbc";
    src = fetchFromGitHub ({
      owner = "lyonel";
      repo = "lshw";
      rev = "b4e067307906ec6f277cce5c8a882f5edd03cbbc";
      fetchSubmodules = false;
      sha256 = "sha256-ahdaQeYZEFCVxwAMJPMB9bfo3ndIiqFyM6OghXwtm1A=";
    });
    date = "2023-03-20";
  };
  mpv-discord = {
    pname = "mpv-discord";
    version = "861bfe54f4b3a1538c475fcf8e4e1fea38039419";
    src = fetchFromGitHub ({
      owner = "tnychn";
      repo = "mpv-discord";
      rev = "861bfe54f4b3a1538c475fcf8e4e1fea38039419";
      fetchSubmodules = false;
      sha256 = "sha256-P1UaXGboOiqrXapfLzJI6IT3esNtflkQkcNXt4Umukc=";
    });
    date = "2022-02-21";
  };
  nvidia-exec = {
    pname = "nvidia-exec";
    version = "9b125cd1d360b48d1f0c1be5fa939e56c71913d3";
    src = fetchFromGitHub ({
      owner = "pedro00dk";
      repo = "nvidia-exec";
      rev = "9b125cd1d360b48d1f0c1be5fa939e56c71913d3";
      fetchSubmodules = false;
      sha256 = "sha256-pR7+FTedDlYKky/AxTlR4ayLqeIbCq68bjBklClrhBY=";
    });
    date = "2023-03-12";
  };
  phocus = {
    pname = "phocus";
    version = "0cf0eb35a927bffcb797db8a074ce240823d92de";
    src = fetchFromGitHub ({
      owner = "phocus";
      repo = "gtk";
      rev = "0cf0eb35a927bffcb797db8a074ce240823d92de";
      fetchSubmodules = false;
      sha256 = "sha256-URuoDJVRQ05S+u7mkz1EN5HWquhTC4OqY8MqAbl0crk=";
    });
    date = "2022-11-03";
  };
  picom = {
    pname = "picom";
    version = "05ef18d78f96a0a970742f1dff40fcf505a0daa6";
    src = fetchFromGitHub ({
      owner = "yshui";
      repo = "picom";
      rev = "05ef18d78f96a0a970742f1dff40fcf505a0daa6";
      fetchSubmodules = false;
      sha256 = "sha256-AvtN1aE9zCsaf2UR4vzPExnJTibYACGDuQcTpOEUkpM=";
    });
    date = "2023-04-01";
  };
  picom-dccsillag = {
    pname = "picom-dccsillag";
    version = "51b21355696add83f39ccdb8dd82ff5009ba0ae5";
    src = fetchFromGitHub ({
      owner = "dccsillag";
      repo = "picom";
      rev = "51b21355696add83f39ccdb8dd82ff5009ba0ae5";
      fetchSubmodules = false;
      sha256 = "sha256-crCwRJd859DCIC0pEerpDqdX2j8ZrNAzVaSSB3mTPN8=";
    });
    date = "2022-05-29";
  };
  picom-pijulius = {
    pname = "picom-pijulius";
    version = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
    src = fetchFromGitHub ({
      owner = "pijulius";
      repo = "picom";
      rev = "982bb43e5d4116f1a37a0bde01c9bda0b88705b9";
      fetchSubmodules = false;
      sha256 = "sha256-YiuLScDV9UfgI1MiYRtjgRkJ0VuA1TExATA2nJSJMhM=";
    });
    date = "2021-10-23";
  };
  stevenblack-blocklist = {
    pname = "stevenblack-blocklist";
    version = "791dd9d63129f687c58175446e101c44794343f4";
    src = fetchFromGitHub ({
      owner = "stevenblack";
      repo = "hosts";
      rev = "791dd9d63129f687c58175446e101c44794343f4";
      fetchSubmodules = false;
      sha256 = "sha256-xK20e/Ld7HMKYRCRmfmd+FJ7JLSxwcKDCKGtKOxxNCE=";
    });
    date = "2023-05-05";
  };
}
