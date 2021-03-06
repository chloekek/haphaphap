super: self:

let

    # By default, php ships with a large amount of extensions.
    # This incurs a lot of dependencies that we do not need.
    # Hence we create a small list of allowed exensions.
    phpExtensions = { all, ... }: [

        # The opcache extension enables php bytecode caching.
        # Using opcache, php-fpm won’t compile the code again for each request.
        all.opcache

        # The pgsql extension provides a postgresql client library.
        all.pgsql

        # The following extensions are required by composer or psalm.
        all.dom
        all.filter
        all.mbstring
        all.openssl
        all.simplexml
        all.tokenizer

    ];

    # We want to use postgis for geographical queries.
    # This has to be added to postgresql as an extension.
    postgresqlPackages = p: [
        p.postgis
    ];

in

{
    # Configure the port numbers used by the backend services.
    haphaphap.ports = {
        nginx      = 5000;
        php-fpm    = 5001;
        postgresql = 5002;
    };

    # For some packages we want very specific versions.
    # We shall specify those here.
    haphaphap.versions = {
        php = super.php80.withExtensions phpExtensions;
        postgresql = super.postgresql_13.withPackages postgresqlPackages;
    };

    # Export haphaphap packages from other directories.
    haphaphap.app.backend = self.callPackage ../app/backend { };
    haphaphap.app.web = self.callPackage ../app/web { };
    haphaphap.ops.hivemind = self.callPackage ../ops/hivemind { };
    haphaphap.ops.nginx = self.callPackage ../ops/nginx { };
    haphaphap.ops.php-fpm = self.callPackage ../ops/php-fpm { };
    haphaphap.ops.postgresql = self.callPackage ../ops/postgresql { };
    haphaphap.scripts = self.callPackage ../scripts { };
    haphaphap.tests = self.callPackage ../tests { };
}
