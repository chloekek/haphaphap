super: self:

{
    # Configure the port numbers used by the backend services.
    haphaphap.ports = {
        nginx   = 5000;
        php-fpm = 5001;
    };

    # Export haphaphap packages from other directories.
    haphaphap.ops.hivemind = self.callPackage ../ops/hivemind { };
    haphaphap.ops.nginx = self.callPackage ../ops/nginx { };
}
