
`ghc-8.10.7` yields different results when compiling [Main.hs](Main.hs) with haskell.nix.

Without haskell.nix:

```
$ nix-shell --pure -p haskell.compiler.ghc8107

$ runghc --ghc-arg=-package --ghc-arg=ghc Main.hs
base >= 4.14.3
ghc >= 8.10.7
```

With haskell.nix:
```
$ nix-shell --pure

$ runghc --ghc-arg=-package --ghc-arg=ghc Main.hs

Main.hs:3:16: error: Module ‘CoreSyn’ does not export ‘Tickish’
  |
3 | import CoreSyn(Tickish)
  |                ^^^^^^^

```
