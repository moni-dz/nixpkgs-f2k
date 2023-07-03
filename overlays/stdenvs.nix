{ getPackage, ... }:

{
  flake.overlays.stdenvs = final: prev:
    let
      commonFlags = [
        "-O3"
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
        # not supported on clang 14 yet, and isn't ignored
        # "-fcx-limited-range"
        # "-fcx-fortran-rules"
      ];

      /*
                Example:

                { lib, clangStdenv, ... }:

                (lib.optimizeStdenv "armv9-a" clangStdenv).mkDerivation { ... }
              */
      optimizeStdenv = march: prev.stdenvAdapters.withCFlags (commonFlags ++ [ "-march=${march}" ]);

      /*
                Example:

                { lib, stdenv, ... }:

                (lib.optimizeStdenvWithNative stdenv).mkDerivation { ... }
              */
      optimizeStdenvWithNative = stdenv: prev.stdenvAdapters.impureUseNativeOptimizations (prev.stdenvAdapters.withCFlags commonFlags stdenv);
    in
    {
      lib = prev.lib.extend (_: _: { inherit optimizeStdenv optimizeStdenvWithNative; });
      optimizedV4Stdenv = final.lib.optimizeStdenv "x86-64-v4" prev.stdenv;
      optimizedV3Stdenv = final.lib.optimizeStdenv "x86-64-v3" prev.stdenv;
      optimizedV2Stdenv = final.lib.optimizeStdenv "x86-64-v2" prev.stdenv;
      optimizedNativeStdenv = prev.lib.warn "using native optimizations, forfeiting reproducibility" optimizeStdenvWithNative prev.stdenv;
      optimizedV4ClangStdenv = final.lib.optimizeStdenv "x86-64-v4" prev.llvmPackages_14.stdenv;
      optimizedV3ClangStdenv = final.lib.optimizeStdenv "x86-64-v3" prev.llvmPackages_14.stdenv;
      optimizedV2ClangStdenv = final.lib.optimizeStdenv "x86-64-v2" prev.llvmPackages_14.stdenv;
      optimizedNativeClangStdenv = prev.lib.warn "using native optimizations, forfeiting reproducibility" optimizeStdenvWithNative prev.llvmPackages_14.stdenv;
    };
}
