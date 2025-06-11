_:

{
  flake.overlays.stdenvs = final: prev:
    let
      /*
        optlevel would be one of: 0, 1, 2, 3, s, z, fast

        Consult your compiler's documentation.

        Summary for clang anyway: https://gist.github.com/lolo32/fd8ce29b218ac2d93a9e
      */
      commonFlags = optlevel: [
        "-O${optlevel}"
        "-pipe"
      ];

      /*
        Example:

        { lib, clangStdenv, ... }:

        (lib.optimizeStdenv "armv9-a" "3" clangStdenv).mkDerivation { ... }
        (lib.optimizeStdenv' "cortex-a78" "fast" clangStdenv).mkDerivation { ... }
      */
      optimizeStdenv = march: optlevel: prev.stdenvAdapters.withCFlags ((commonFlags optlevel) ++ [ "-march=${march}" ]);
      optimizeStdenv' = mcpu: optlevel: prev.stdenvAdapters.withCFlags ((commonFlags optlevel) ++ [ "-mcpu=${mcpu}" ]);

      /*
        Example:

        { lib, stdenv, ... }:

        (lib.optimizeStdenvWithNative stdenv "s").mkDerivation { ... }
      */
      optimizeStdenvWithNative = optlevel: stdenv: prev.stdenvAdapters.impureUseNativeOptimizations (prev.stdenvAdapters.withCFlags (commonFlags optlevel) stdenv);
    in
    {
      lib = prev.lib.extend (_: _: { inherit optimizeStdenv optimizeStdenv' optimizeStdenvWithNative; });
      optimizedV4Stdenv = final.lib.optimizeStdenv "x86-64-v4" "fast" prev.stdenv;
      optimizedV3Stdenv = final.lib.optimizeStdenv "x86-64-v3" "fast" prev.stdenv;
      optimizedV2Stdenv = final.lib.optimizeStdenv "x86-64-v2" "fast" prev.stdenv;
      optimizedNativeStdenv = prev.lib.warn "using native optimizations, forfeiting reproducibility" final.lib.optimizeStdenvWithNative "fast" prev.stdenv;
      optimizedV4ClangStdenv = final.lib.optimizeStdenv "x86-64-v4" "fast" prev.llvmPackages_latest.stdenv;
      optimizedV3ClangStdenv = final.lib.optimizeStdenv "x86-64-v3" "fast" prev.llvmPackages_latest.stdenv;
      optimizedV2ClangStdenv = final.lib.optimizeStdenv "x86-64-v2" "fast" prev.llvmPackages_latest.stdenv;
      optimizedNativeClangStdenv = prev.lib.warn "using native optimizations, forfeiting reproducibility" final.lib.optimizeStdenvWithNative "fast" prev.llvmPackages_latest.stdenv;
      appleM1Stdenv = final.lib.optimizeStdenv' "apple-m1" "fast" prev.llvmPackages_latest.stdenv;
      appleM2Stdenv = final.lib.optimizeStdenv' "apple-m2" "fast" prev.llvmPackages_latest.stdenv;
    };
}
