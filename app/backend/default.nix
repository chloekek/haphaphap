# This derivation statically analyzes the backend source code.
# It then copies the code to the output for packaging.

{ haphaphap, runCommand }:

let
    name = "haphaphap-app-backend";
    env = {
        buildInputs = [
            haphaphap.versions.php.packages.composer
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

        # Generate the autoloader, which automatically loads classes.
        # The autoloader is configured in composer.json,
        # and will load classes in the Haphaphap namespace
        # from the files in the lib directory.
        COMPOSER=${./composer.json} composer dump-autoload

        # Type check the php code using psalm.
        HOME=$PWD psalm --config=${./psalm.xml} lib www

        # Move the source to the output directory.
        mv lib www vendor $out
    '';
in
    runCommand name env cmd
