-- migrate:up

CREATE TABLE menu_items
(
    id uuid NOT NULL,
    restaurant_id uuid NOT NULL,

    name varchar NOT NULL,

    features bigint NOT NULL,

    CONSTRAINT menu_items_pk
        PRIMARY KEY (id),

    CONSTRAINT menu_items_restaurant_fk
        FOREIGN KEY (restaurant_id)
        REFERENCES restaurants (id)
        ON DELETE CASCADE
);

GRANT SELECT, INSERT, UPDATE, DELETE
    ON TABLE menu_items
    TO haphaphap_app;

-- migrate:down

DROP TABLE menu_items;
