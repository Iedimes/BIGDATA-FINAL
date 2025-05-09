SET search_path TO final;

DROP TABLE IF EXISTS vacunados_datos_limpios;

CREATE TABLE vacunados_datos_limpios (
    nombre TEXT,
    apellido TEXT,
    establecimiento TEXT,
    fecha_aplicacion DATE,
    cedula VARCHAR(25),
    dosis INTEGER,
    descripcion_vacuna TEXT,
    actualizado_al TIMESTAMP
);