{ lib, stdenvNoCC, fetchFromGitHub }:

/*
  Usage: `pkgs.mpv.override { scripts = [ inputs.nixpkgs-f2k.packages.${system}.mpv-discord-script ]; }`

  Manage this file with Nix: https://github.com/tnychn/mpv-discord/blob/master/script-opts/discord.conf
  
  Set `binary_path=${inputs.nixpkgs-f2k.packages.${system}.mpv-discord}`
*/
stdenvNoCC.mkDerivation rec {
  pname = "mpv-discord-script";
  version = "1.6.1";

  src = fetchFromGitHub {
    owner = "tnychn";
    repo = "mpv-discord";
    rev = "v${version}";
    hash = "sha256-P1UaXGboOiqrXapfLzJI6IT3esNtflkQkcNXt4Umukc=";
  };

  dontBuild = true;

  installPhase = ''
    mkdir -p $out/share/mpv
    cp -r scripts $out/share/mpv
  '';

  meta = with lib; {
    description = "A cross-platform Discord Rich Presence integration for mpv with no external dependencies (mpv script)";
    homepage = "https://github.com/tnychn/mpv-discord";
    license = licenses.mit;
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}

