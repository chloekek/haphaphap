# This script creates the postgresql cluster, roles, and database.

# De facto bash strict mode.
set -efuo pipefail

# If the cluster does not yet exist, create it.
if ! [[ -e var/postgresql/data ]]; then

    # Invoke initdb, which creates the database cluster.
    # The following options are specified:
    #
    #  --locale    Which locale to use for text in the database.
    #              We use the C locale because our data is mixed language.
    #
    #  --username  Username for the superuser.
    #              This is pretty much always expected to be ‘postgres’.
    #
    #  --pwfile    Password for the superuser.
    #              We provide this inline for now, using a ‘<(...)’ fifo.

    initdb                        \
        --locale=C                \
        --username=postgres       \
        --pwfile=<(echo postgres) \
        var/postgresql/data

    # Remove configuration files from the data directory.
    # initdb creates these by default, but we use our own.
    # See ../../ops/postgresql for our configuration files.
    rm var/postgresql/data/{pg_hba,pg_ident,postgresql{,.auto}}.conf

fi

export PGHOST=127.0.0.1
export PGPORT=@POSTGRESQL_PORT@
export PGUSER=postgres
export PGPASSWORD=$PGUSER

# Wait for postgresql to be available.
while ! pg_isready; do
    sleep 1
done

# Create the roles.
psql <<'SQL'
    CREATE ROLE haphaphap_admin LOGIN PASSWORD 'haphaphap_admin';
    CREATE ROLE haphaphap_app LOGIN PASSWORD 'haphaphap_app';
SQL

# Create the database.
psql <<'SQL'
    CREATE DATABASE haphaphap OWNER haphaphap_admin;
SQL

export PGDATABASE=haphaphap

# Fix the permissions on the ‘public’ schema.
# By default, all roles can read and write this schema,
# but we only want some roles to be able to do that.
psql <<'SQL'
    REVOKE ALL PRIVILEGES ON SCHEMA public FROM PUBLIC;
    GRANT CREATE, USAGE ON SCHEMA public TO haphaphap_admin;
    GRANT USAGE ON SCHEMA public TO haphaphap_app;
SQL

# Create the postgresql extensions we use.
psql <<'SQL'
    CREATE EXTENSION postgis;
SQL
