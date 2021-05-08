# This derivation packages the integration tests.
# The integration tests connect to the running app,
# send requests to the app, and verify the app’s responses.

{ haphaphap, makeWrapper, perl, runCommand }:

let
    perlPackages = p: [ p.LWPUserAgent ];
    perlWithPackages = perl.withPackages perlPackages;

    name = "haphaphap-tests";
    env = {
        buildInputs = [
            makeWrapper
        ];
    };
    cmd = ''
        # Create derivation output directories.
        mkdir --parents $out/bin

        # Move the tests to the output directory.
        cp --recursive ${./lib} $out/lib
        cp --recursive ${./t} $out/t

        # Create a wrapper for the prove program,
        # so that it will run all the tests,
        # and has the lib modules available,
        # as well as the psql program.
        makeWrapper                                              \
            ${perlWithPackages}/bin/prove                        \
            $out/bin/prove                                       \
            --prefix PATH : ${haphaphap.versions.postgresql}/bin \
            --prefix PERL5LIB : $out/lib                         \
            --add-flags $out/t
    '';
in
    runCommand name env cmd
