{ lib, stdenvNoCC, sass, src, version, colors, primary, secondary }:

stdenvNoCC.mkDerivation rec {
  pname = "phocus";
  inherit src version;

  patches = [
    ./remove-npm.diff
    ./gradient.diff
    ./accent-substitute-all.diff
  ];

  postPatch = with colors; ''
    substituteInPlace scss/gtk-3.0/_colors.scss \
      --replace "@bg0@" "#${base00}" \
      --replace "@bg1@" "#${base01}" \
      --replace "@bg2@" "#${base02}" \
      --replace "@bg3@" "#${base03}" \
      --replace "@bg4@" "#${base04}" \
      --replace "@red@" "#${base08}" \
      --replace "@lred@" "#${base08}" \
      --replace "@orange@" "#${base09}" \
      --replace "@lorange@" "#${base09}" \
      --replace "@yellow@" "#${base0A}" \
      --replace "@lyellow@" "#${base0A}" \
      --replace "@green@" "#${base0B}" \
      --replace "@lgreen@" "#${base0B}" \
      --replace "@cyan@" "#${base0C}" \
      --replace "@lcyan@" "#${base0C}" \
      --replace "@blue@" "#${base0D}" \
      --replace "@lblue@" "#${base0D}" \
      --replace "@purple@" "#${base0F}" \
      --replace "@lpurple@" "#${base0F}" \
      --replace "@pink@" "#${base0E}" \
      --replace "@lpink@" "#${base0E}" \
      --replace "@primary@" "#${primary}" \
      --replace "@secondary@" "#${secondary}"
  '';

  nativeBuildInputs = [ sass ];

  installFlags = [ "DESTDIR=$(out)" "PREFIX=" ];

  meta = with lib; {
    description = "From scratch, clean and opinionated GTK3 implementation of the phocus color scheme";
    homepage = "https://github.com/phocus/gtk";
    license = [ licenses.mit ];
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
