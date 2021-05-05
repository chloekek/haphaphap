# Nginx is the web server that clients connect to.
# This derivation builds our nginx configuration.

{ haphaphap, nginx, runCommand }:

let
    name = "haphaphap-ops-nginx";
    env = { };
    cmd = ''
        # Create derivation output directories.
        mkdir --parents $out/{bin,etc}

        # Substitute the port numbers and paths into the configuration file.
        # Then write the configuration file to the output path.
        sed --file=- <<'SED' ${./nginx.conf} > $out/etc/nginx.conf
            s:@NGINX_PORT@:${toString haphaphap.ports.nginx}:g
            s:@PHP_FPM_PORT@:${toString haphaphap.ports.php-fpm}:g
            s:@APP_BACKEND@:${toString haphaphap.app.backend}:g
        SED

        # Copy included configuration files to the output as well.
        cp ${./fastcgi.conf} $out/etc/fastcgi.conf

        # For convenience, export a symbolic link to nginx.
        ln --symbolic ${nginx}/bin/nginx $out/bin/nginx
    '';
in
    runCommand name env cmd
