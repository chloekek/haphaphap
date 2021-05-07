# This derivation builds the web app using rollup and svelte.
# Rollup is a tool that calls the svelte compiler,
# and then combines all the generated js modules into a single file.
# Rollup is configured using rollup.config.js.

{ nodePackages, nodejs, runCommand }:

let
    name = "haphaphap-app-web";
    env = {
        buildInputs = [
            # Some of these dependencies come from nixpkgs,
            # others come from ../../nix/extra-node-packages.
            nodePackages."@rollup/plugin-node-resolve"
            nodePackages.rollup
            nodePackages.rollup-plugin-css-only
            nodePackages.rollup-plugin-svelte
            nodePackages.svelte
            nodejs
        ];
    };
    cmd = ''
        # Create derivation output directories.
        mkdir --parents $out/www

        # Copy source files to working directory.
        cp --recursive ${./src} src

        # Build the svelte code using rollup.
        rollup --config ${./rollup.config.js}

        # Place the app in the output directory.
        cp src/index.html $out/www
        mv app.{css,js} $out/www
    '';
in
    runCommand name env cmd
