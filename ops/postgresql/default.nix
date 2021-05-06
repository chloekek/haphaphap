# Postgresql is the database management system we use to store our data.
# This derivation builds our postgresql configuration.
# Database schema migrations and management tools can be found in ../../db.

{ haphaphap, runCommand }:

let
    name = "haphaphap-ops-postgresql";
    env = { };
    cmd = ''
        # Create derivation output directories.
        mkdir --parents $out/{bin,etc}

        # Substitute the port numbers and paths into the configuration file.
        # Then write the configuration file to the output path.
        sed --file=- <<SED ${./postgresql.conf} > $out/etc/postgresql.conf
            s:@POSTGRESQL@:$out:g
            s:@POSTGRESQL_PORT@:${toString haphaphap.ports.postgresql}:g
        SED

        # Copy other configuration files to the output as well.
        cp ${./pg_hba.conf} $out/etc/pg_hba.conf
        cp ${./pg_ident.conf} $out/etc/pg_ident.conf

        # For convenience, export a symbolic link to postgresql daemon,
        # as well as the files that postgres needs to function.
        ln --symbolic ${haphaphap.versions.postgresql}/bin/postgres \
                      $out/bin/postgres
        ln --symbolic ${haphaphap.versions.postgresql}/share $out/share
    '';
in
    runCommand name env cmd
