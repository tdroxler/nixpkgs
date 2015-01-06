# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, chunkedData, machines, transformers }:

cabal.mkDerivation (self: {
  pname = "machines-io";
  version = "0.2.0.0";
  sha256 = "0qjbfwyhscjmjbfj709kb9xr5p3yz4v21aq2g4dv1abqwgf85x03";
  buildDepends = [ chunkedData machines transformers ];
  meta = {
    homepage = "http://github.com/aloiscochard/machines-io";
    description = "IO utilities for the machines library";
    license = self.stdenv.lib.licenses.asl20;
    platforms = self.ghc.meta.platforms;
  };
})
