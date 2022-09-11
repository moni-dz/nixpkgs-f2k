# This file was generated by nvfetcher, please do not modify it manually.
{ fetchgit, fetchurl, fetchFromGitHub }:
{
  awesome = {
    pname = "awesome";
    version = "6ca2fbb31c5cdf50b946b50f3f814f39a8f1cfbe";
    src = fetchFromGitHub ({
      owner = "awesomeWM";
      repo = "awesome";
      rev = "6ca2fbb31c5cdf50b946b50f3f814f39a8f1cfbe";
      fetchSubmodules = false;
      sha256 = "sha256-7CD0RszmPdIHD1GGpVtJ4uAFIsQCFFY2z3NPZmA1Kuk=";
    });
  };
  awesome-composite = {
    pname = "awesome-composite";
    version = "5d49eb57c4c0de2f9138001847f542718a10cc10";
    src = fetchFromGitHub ({
      owner = "xinhaoyuan";
      repo = "awesome";
      rev = "5d49eb57c4c0de2f9138001847f542718a10cc10";
      fetchSubmodules = false;
      sha256 = "sha256-V7mnpIuOGem+N+bNP1sLHuOdBdUdSVcfehfWCpbKsac=";
    });
  };
  lshw = {
    pname = "lshw";
    version = "42fef565731411a784101de614a54bff79d1858e";
    src = fetchFromGitHub ({
      owner = "lyonel";
      repo = "lshw";
      rev = "42fef565731411a784101de614a54bff79d1858e";
      fetchSubmodules = false;
      sha256 = "sha256-Gt9RoTBCr1f5szmuRdrmQo9FNAflv+arq+KfFGP9b1E=";
    });
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
  };
  nvidia-exec = {
    pname = "nvidia-exec";
    version = "1dd1ecefe383cf115ba1680d5b1aa52b66ca9101";
    src = fetchFromGitHub ({
      owner = "pedro00dk";
      repo = "nvidia-exec";
      rev = "1dd1ecefe383cf115ba1680d5b1aa52b66ca9101";
      fetchSubmodules = false;
      sha256 = "sha256-UYl8XgIfWnRC1IYSX9ag8gTU9ENRDqoF2fBbuBRMb3o=";
    });
  };
  phocus = {
    pname = "phocus";
    version = "945ad3940c69222d45a2bd06e0838164002b6690";
    src = fetchFromGitHub ({
      owner = "phocus";
      repo = "gtk";
      rev = "945ad3940c69222d45a2bd06e0838164002b6690";
      fetchSubmodules = false;
      sha256 = "sha256-yz4gcK7gZ4lFAyehiPgtLDcPs12xFP+RqSriOsbv6to=";
    });
  };
  picom = {
    pname = "picom";
    version = "e0758eb5e572d5d7cf28f28e5e409f20e0bd2ded";
    src = fetchFromGitHub ({
      owner = "yshui";
      repo = "picom";
      rev = "e0758eb5e572d5d7cf28f28e5e409f20e0bd2ded";
      fetchSubmodules = false;
      sha256 = "sha256-L0cFkKPFw92dx3P9jlkwgw7/otjUVkVZbOE0UT6gF+I=";
    });
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
  };
  stevenblack-blocklist = {
    pname = "stevenblack-blocklist";
    version = "db16b1e6b745f396ca2d3b7e6fd51ec170e884f1";
    src = fetchFromGitHub ({
      owner = "stevenblack";
      repo = "hosts";
      rev = "db16b1e6b745f396ca2d3b7e6fd51ec170e884f1";
      fetchSubmodules = false;
      sha256 = "sha256-45GjVHqYq4nkhhGhBoG+ws9IPPUNLiYdKxntjJHEomM=";
    });
  };
}
