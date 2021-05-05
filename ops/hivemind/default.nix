# Hivemind is a process supervisor for use in development.
# It is not used in production, where we use systemd instead.
# Hivemind starts the listed processes and exits if any of them exit.
# It also stops all of the listed processes when it exits.

{ haphaphap, hivemind, runCommand }:

let
    name = "haphaphap-ops-hivemind";
    env = { };
    cmd = ''
        # Create derivation output directories.
        mkdir --parents $out/{bin,etc}

        # Substitute the programs’ paths into the configuration file.
        # Then write the configuration file to the output path.
        sed --file=- <<'SED' ${./Procfile} > $out/etc/Procfile
            s:@NGINX@:${toString haphaphap.ops.nginx}:g
        SED

        # For convenience, export a symbolic link to hivemind.
        ln --symbolic ${hivemind}/bin/hivemind $out/bin/hivemind
    '';
in
    runCommand name env cmd
