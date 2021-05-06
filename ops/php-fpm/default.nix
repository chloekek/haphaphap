# Php-fpm is the application server that runs php code.
# This derivation builds our php-fpm configuration.

{ haphaphap, runCommand }:

let
    name = "haphaphap-ops-php-fpm";
    env = { };
    cmd = ''
        # Create derivation output directories.
        mkdir --parents $out/{bin,etc}

        # Substitute the port numbers into the configuration file.
        # Then write the configuration file to the output path.
        sed --file=- <<'SED' ${./php-fpm.conf} > $out/etc/php-fpm.conf
            s:@PHP_FPM_PORT@:${toString haphaphap.ports.php-fpm}:g
            s:@POSTGRESQL_PORT@:${toString haphaphap.ports.postgresql}:g
        SED

        # For convenience, export a symbolic link to php-fpm.
        ln --symbolic ${haphaphap.versions.php}/bin/php-fpm $out/bin/php-fpm
    '';
in
    runCommand name env cmd
