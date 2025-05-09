SET search_path TO final;


DROP TABLE IF EXISTS vacunas;


CREATE TABLE vacunas (
    id SERIAL PRIMARY KEY,
    descripcion TEXT UNIQUE
);