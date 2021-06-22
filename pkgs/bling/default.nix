{ lib, stdenv, toLuaModule, lua, src }:

toLuaModule (stdenv.mkDerivation rec {
  name = "bling-${version}";
  version = "unstable-2021-05-12";

  inherit src;

  buildInputs = [ lua ];

  installPhase = ''
    mkdir -p $out/lib/lua/${lua.luaversion}/
    cp -r . $out/lib/lua/${lua.luaversion}/bling/
    printf "package.path = '$out/lib/lua/${lua.luaversion}/bling/init.lua;' ..  package.path\nreturn require((...) .. '.init')\n" > $out/lib/lua/${lua.luaversion}/bling.lua
  '';

  meta = with lib; {
    description = "Utilities for the awesome window manager";
    homepage = "https://blingcorp.github.io/bling/#/";
    license = licenses.mit;
    maintainers = with maintainers; [ fortuneteller2k ];
  };
})
