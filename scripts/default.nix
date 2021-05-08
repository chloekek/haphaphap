# This derivation packages maintenance scripts.
# It also checks them using shellcheck.

{ bash, dbmate, haphaphap, makeWrapper, runCommand, shellcheck }:

let
    name = "haphaphap-scripts";
    env = {
        buildInputs = [
            makeWrapper
            shellcheck
        ];
    };
    cmd = ''
        # Create derivation output directories.
        mkdir --parents $out/{bin,lib}

        # Copy the source files to the working directory.
        cp ${./setup-database.bash} setup-database.bash

        for f in *.bash; do

            # Check the script using shellcheck.
            # This points out many types of mistakes.
            shellcheck $f

            # Substitute the port numbers into the script.
            sed --file=- <<SED $f > $out/lib/$f
                s:@POSTGRESQL_PORT@:${toString haphaphap.ports.postgresql}:g
        SED

            # Generate a wrapper for bash that passes the script.
            # Also make the postgresql command-line tools available.
            makeWrapper                                              \
                ${bash}/bin/bash                                     \
                $out/bin/$f                                          \
                --prefix PATH : ${haphaphap.versions.postgresql}/bin \
                --add-flags $out/lib/$f

        done

        # Convenient wrapper for migration tool,
        # which is pre-configured correctly.
        makeWrapper                      \
            ${dbmate}/bin/dbmate         \
            $out/bin/dbmate              \
            --add-flags --migrations-dir \
            --add-flags scripts/dbschema \
            --add-flags --url            \
            --add-flags 'postgres://haphaphap_admin:haphaphap_admin@127.0.0.1:5002/haphaphap?sslmode=disable'
    '';
in
    runCommand name env cmd
