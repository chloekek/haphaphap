# This derivation statically analyzes the backend source code.
# It then copies the code to the output for packaging.

{ haphaphap, runCommand }:

let
    name = "haphaphap-app-backend";
    env = {
        buildInputs = [
            haphaphap.versions.php.packages.psalm
        ];
    };
    cmd = ''
        # Create derivation output directories.
        mkdir --parents $out

        # Copy the source to the working directory.
        # We pass --no-preserve=mode so we can move the files later.
        cp --no-preserve=mode --recursive ${./lib} lib
        cp --no-preserve=mode --recursive ${./www} www

        # Type check the php code.
        HOME=$PWD psalm --config=${./psalm.xml} lib www

        # Move the source to the output directory.
        mv lib www $out
    '';
in
    runCommand name env cmd
