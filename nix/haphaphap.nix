super: self:

let

    # By default, php ships with a large amount of extensions.
    # This incurs a lot of dependencies that we do not need.
    # Hence we create a small list of allowed exensions.
    phpExtensions = { all, ... }: [
        all.pgsql
    ];

in

{
    # Configure the port numbers used by the backend services.
    haphaphap.ports = {
        nginx   = 5000;
        php-fpm = 5001;
    };

    # For some packages we want very specific versions.
    # We shall specify those here.
    haphaphap.versions = {
        php = super.php80.withExtensions phpExtensions;
    };

    # Export haphaphap packages from other directories.
    haphaphap.app.backend = self.callPackage ../app/backend { };
    haphaphap.ops.hivemind = self.callPackage ../ops/hivemind { };
    haphaphap.ops.nginx = self.callPackage ../ops/nginx { };
    haphaphap.ops.php-fpm = self.callPackage ../ops/php-fpm { };
}
