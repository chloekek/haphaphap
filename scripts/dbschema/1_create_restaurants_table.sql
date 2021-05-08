-- migrate:up

CREATE TABLE restaurants
(
    id uuid NOT NULL,

    name varchar NOT NULL,

    location geography(point) NOT NULL,

    CONSTRAINT restaurants_pk
        PRIMARY KEY (id)
);

CREATE INDEX restaurants_location_ix
    ON restaurants
    USING GIST
    (location);

GRANT SELECT, INSERT, UPDATE, DELETE
    ON TABLE restaurants
    TO haphaphap_app;

-- migrate:down

DROP TABLE restaurants;
