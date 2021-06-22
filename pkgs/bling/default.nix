{ lib, stdenv, toLuaModule, luaPackages, src }:

toLuaModule (stdenv.mkDerivation rec {
  pname = "bling";
  version = "unstable";

  inherit src;

  buildInputs = [ luaPackages.lua ];

  installPhase = ''
    mkdir -p $out/lib/lua/${luaPackages.lua.luaversion}/${pname}
    cp -r . $out/lib/lua/${luaPackages.lua.luaversion}/${pname}
  '';

  meta = with lib; {
    description = "Utilities for the awesome window manager";
    homepage = "https://blingcorp.github.io/bling/#/";
    license = licenses.mit;
    maintainers = with maintainers; [ fortuneteller2k ];
  };
})
