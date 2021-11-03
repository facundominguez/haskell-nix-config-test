let
  #sources = {
  #  haskellNix = builtins.fetchTarball "https://github.com/input-output-hk/haskell.nix/archive/f5ec5311fa805b46f5276e2b4f574c8e7544a30b.tar.gz";
  #};
  sources = import ./nix/sources.nix {};

  # Fetch the haskell.nix commit we have pinned with Niv
  haskellNix = import sources.haskellNix {};
  # If haskellNix is not found run:
  #   niv add input-output-hk/haskell.nix -n haskellNix

  # Import nixpkgs and pass the haskell.nix provided nixpkgsArgs
  pkgs = import
    # haskell.nix provides access to the nixpkgs pins which are used by our CI,
    # hence you will be more likely to get cache hits when using these.
    # But you can also just use your own, e.g. '<nixpkgs>'.
    haskellNix.sources.nixpkgs-2009
    # These arguments passed to nixpkgs, include some patches and also
    # the haskell.nix functionality itself as an overlay.
    haskellNix.nixpkgsArgs;

  build = pkgs.haskell-nix.project {
    # 'cleanGit' cleans a source directory based on the files known by git
	src = pkgs.haskell-nix.haskellLib.cleanGit {
	  name = "haskell-nix-config-test";
      src = ./.;
	};
    # Specify the GHC version to use.
    compiler-nix-name = "ghc8107";
  };
in
build.shellFor {
    nativeBuildInputs = with pkgs; [
    ];
  }
