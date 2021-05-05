let
    nixpkgsFile = builtins.readFile ./nixpkgs.json;
    nixpkgsSpec = builtins.fromJSON nixpkgsFile;
    nixpkgsTarball = fetchTarball nixpkgsSpec;
    config = { };
    overlays = [
        (import ./haphaphap.nix)
    ];
in
    import nixpkgsTarball {
        inherit config overlays;
    }
