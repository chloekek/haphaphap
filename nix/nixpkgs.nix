let
    nixpkgsFile = builtins.readFile ./nixpkgs.json;
    nixpkgsSpec = builtins.fromJSON nixpkgsFile;
    nixpkgsTarball = fetchTarball nixpkgsSpec;
    config = { };
    overlays = [
        (import ./extra-node-packages)
        (import ./haphaphap.nix)
    ];
in
    import nixpkgsTarball {
        inherit config overlays;
    }
