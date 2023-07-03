{ lib, stdenvNoCC, sass, src, version }:

stdenvNoCC.mkDerivation rec {
  pname = "phocus";
  inherit src version;

  patches = [ ./remove-npm.diff ];
  nativeBuildInputs = [ sass ];
  installFlags = [ "DESTDIR=$(out)" "PREFIX=" ];

  meta = with lib; {
    description = "From scratch, clean and opinionated GTK3 implementation of the phocus color scheme";
    homepage = "https://github.com/phocus/gtk";
    license = [ licenses.mit ];
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
