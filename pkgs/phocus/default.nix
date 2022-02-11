{ lib, stdenvNoCC, sass, src, version, colors, primary, secondary }:

stdenvNoCC.mkDerivation rec {
  pname = "phocus";
  inherit version;
  inherit src;

  patches = [
    ./remove-npm.diff
    ./gradient.diff
  ];

  prePatch = with colors; ''
    substituteInPlace scss/gtk-3.0/_colors.scss \
      --replace "hsl(240, 3%, 4%)" "#${base00}" \
      --replace "hsl(240, 3%, 8%)" "#${base01}" \
      --replace "hsl(240, 3%, 12%)" "#${base02}" \
      --replace "hsl(240, 3%, 16%)" "#${base03}" \
      --replace "hsl(240, 3%, 20%)" "#${base04}" \
      --replace "hsl(0,60%,60%)" "#${base08}" \
      --replace "hsl(25,60%,60%)" "#${base09}" \
      --replace "hsl(55,60%,60%)" "#${base0A}" \
      --replace "hsl(145,60%,60%)" "#${base0B}" \
      --replace "hsl(185,60%,60%)" "#${base0C}" \
      --replace "hsl(240,60%,60%)" "#${base0D}" \
      --replace "hsl(265,60%,60%)" "#${base0F}" \
      --replace "hsl(300,60%,60%)" "#${base0E}" \
      --replace "rgba(255,255,255,0.15)" "#${base04}" \
      --replace "\$accent-7;" "#${primary};" \
      --replace "\$accent-4;" "#${secondary};"
  '';

  nativeBuildInputs = [ sass ];

  installFlags = [ "DESTDIR=$(out)" "PREFIX=" ];

  meta = with lib; {
    description = "phocus with horizon theme";
    homepage = "https://github.com/fortuneteller2k/gtk";
    license = [ licenses.mit ];
    maintainers = with maintainers; [ fortuneteller2k ];
  };
}
