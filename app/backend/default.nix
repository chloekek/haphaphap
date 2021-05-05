# This derivation statically analyzes the backend source code.
# It then copies the code to the output for packaging.

{ runCommand }:

let
    name = "haphaphap-app-backend";
    env = { };
    cmd = ''
        # Create derivation output directories.
        mkdir --parents $out

        # Copy the source to the output directory.
        cp --recursive ${./lib} $out/lib
        cp --recursive ${./www} $out/www
    '';
in
    runCommand name env cmd
