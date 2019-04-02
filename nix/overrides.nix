{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  summon-test = (
    with rec {
      summon-testSource = pkgs.lib.cleanSource ../.;
      summon-testBasic  = self.callCabal2nix "summon-test" summon-testSource { };
    };
    overrideCabal summon-testBasic (old: {
    })
  );
}
