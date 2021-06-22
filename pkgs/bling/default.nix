{ lib, stdenv, toLuaModule, lua, src }:

toLuaModule (stdenv.mkDerivation rec {
  pname = "bling";
  version = "unstable";

  inherit src;

  buildInputs = [ lua ];

  installPhase = ''
    mkdir -p $out/lib/lua/${lua.luaversion}/
    cp -r . $out/lib/lua/${lua.luaversion}/${pname}/
    printf "package.path = '$out/lib/lua/${lua.luaversion}/${pname}/init.lua;' ..  package.path\nreturn require((...) .. '.init')\n" > $out/lib/lua/${lua.luaversion}/${pname}.lua
  '';

  meta = with lib; {
    description = "Utilities for the awesome window manager";
    homepage = "https://blingcorp.github.io/bling/#/";
    license = licenses.mit;
    maintainers = with maintainers; [ fortuneteller2k ];
  };
})
