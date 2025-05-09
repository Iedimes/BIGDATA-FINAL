DROP TABLE IF EXISTS vacunados_oficial;

CREATE TABLE vacunados_oficial (
    id SERIAL PRIMARY KEY,
    nombre TEXT,
    apellido TEXT,
    establecimiento_id INTEGER REFERENCES establecimientos(id),
    fecha_aplicacion DATE,
    cedula VARCHAR(25),
    dosis INTEGER,
    vacuna_id INTEGER REFERENCES vacunas(id),
    actualizado_al TIMESTAMP
);