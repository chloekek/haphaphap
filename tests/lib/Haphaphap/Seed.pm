# This module can be imported by tests to seed the database with test data.

package Haphaphap::Seed;

use v5.20;
use warnings;

# Clear the database and insert test data.
sub seed
{
    $ENV{PGHOST} = '127.0.0.1';
    $ENV{PGPORT} = '5002';
    $ENV{PGUSER} = 'haphaphap_admin';
    $ENV{PGPASSWORD} = $ENV{PGUSER};
    $ENV{PGDATABASE} = 'haphaphap';

    system 'psql', '-c', <<'SQL';

        -- Remove existing data.
        TRUNCATE TABLE restaurants;

        -- Insert test restaurants.
        INSERT INTO restaurants
            ( id, name, location )
        VALUES
            (
                '33ea3da1-d435-4e2e-92f2-132243f3f03d',
                'Testaurant 1',
                'SRID=4326;POINT(5.11842 52.09314)'
            ),
            (
                '1b42d096-b7ed-4f1c-94b4-f570f31612d3',
                'Testaurant 2',
                'SRID=4326;POINT(4.8926 52.3723)'
            );

SQL
}

1;
