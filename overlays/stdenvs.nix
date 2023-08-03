{ getPackage, ... }:

{
  flake.overlays.stdenvs = final: prev:
    let
      commonFlags = [
        "-Ofast"
        "-pipe"
        "-ffloat-store"
        "-fexcess-precision=fast"
        "-ffast-math"
        "-fno-rounding-math"
        "-fno-signaling-nans"
        "-fno-math-errno"
        "-funsafe-math-optimizations"
        "-fassociative-math"
        "-freciprocal-math"
        "-ffinite-math-only"
        "-fno-signed-zeros"
        "-fno-trapping-math"
        "-frounding-math"
        "-fsingle-precision-constant"
        "-ftree-vectorize"
        # not supported on clang yet, and isn't ignored
        # "-fcx-limited-range"
        # "-fcx-fortran-rules"
      ];

      /*
        Example:

        { lib, clangStdenv, ... }:

        (lib.optimizeStdenv "armv9-a" clangStdenv).mkDerivation { ... }
        (lib.optimizeStdenv' "cortex-a78" clangStdenv).mkDerivation { ... }
      */
      optimizeStdenv = march: prev.stdenvAdapters.withCFlags (commonFlags ++ [ "-march=${march}" ]);
      optimizeStdenv' = mcpu: prev.stdenvAdapters.withCFlags (commonFlags ++ [ "-mcpu=${mcpu}" ]);

      /*
        Example:

        { lib, stdenv, ... }:

        (lib.optimizeStdenvWithNative stdenv).mkDerivation { ... }
      */
      optimizeStdenvWithNative = stdenv: prev.stdenvAdapters.impureUseNativeOptimizations (prev.stdenvAdapters.withCFlags commonFlags stdenv);
    in
    {
      lib = prev.lib.extend (_: _: { inherit optimizeStdenv optimizeStdenv' optimizeStdenvWithNative; });
      optimizedV4Stdenv = final.lib.optimizeStdenv "x86-64-v4" prev.stdenv;
      optimizedV3Stdenv = final.lib.optimizeStdenv "x86-64-v3" prev.stdenv;
      optimizedV2Stdenv = final.lib.optimizeStdenv "x86-64-v2" prev.stdenv;
      optimizedNativeStdenv = prev.lib.warn "using native optimizations, forfeiting reproducibility" final.lib.optimizeStdenvWithNative prev.stdenv;
      optimizedV4ClangStdenv = final.lib.optimizeStdenv "x86-64-v4" prev.llvmPackages_latest.stdenv;
      optimizedV3ClangStdenv = final.lib.optimizeStdenv "x86-64-v3" prev.llvmPackages_latest.stdenv;
      optimizedV2ClangStdenv = final.lib.optimizeStdenv "x86-64-v2" prev.llvmPackages_latest.stdenv;
      optimizedNativeClangStdenv = prev.lib.warn "using native optimizations, forfeiting reproducibility" final.lib.optimizeStdenvWithNative prev.llvmPackages_latest.stdenv;
      appleM1Stdenv = final.lib.optimizeStdenv' "apple-m1" prev.llvmPackages_latest.stdenv;
      appleM2Stdenv = final.lib.optimizeStdenv' "apple-m2" prev.llvmPackages_latest.stdenv;
    };
}
