SET search_path TO final;


DROP TABLE IF EXISTS establecimientos;

CREATE table establecimientos (
    id SERIAL PRIMARY KEY,
    descripcion TEXT UNIQUE
);