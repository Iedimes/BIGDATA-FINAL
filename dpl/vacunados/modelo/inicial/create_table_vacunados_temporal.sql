SET search_path TO final;


DROP TABLE IF EXISTS vacunados_temporal;

CREATE TABLE vacunados_temporal (
    nombre TEXT,
    apellido TEXT,
    establecimiento TEXT,
    fecha_aplicacion DATE,
    cedula VARCHAR(25),
    dosis INTEGER,
    descripcion_vacuna TEXT,
    actualizado_al TIMESTAMP
);
