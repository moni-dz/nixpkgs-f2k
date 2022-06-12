{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "mpv-discord";
  version = "1.6.1";

  src = fetchFromGitHub {
    owner = "tnychn";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-P1UaXGboOiqrXapfLzJI6IT3esNtflkQkcNXt4Umukc=";
  };

  sourceRoot = "source/${pname}";

  vendorSha256 = "sha256-xe1jyWFQUD+Z4qBAVQ0SBY0gdxmi5XG9t29n3f/WKDs=";

  meta = with lib; {
    description = "A cross-platform Discord Rich Presence integration for mpv with no external dependencies (binary only)";
    homepage = "https://github.com/tnychn/mpv-discord";
    license = licenses.mit;
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
