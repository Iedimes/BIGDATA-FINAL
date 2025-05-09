-- CONSULTA 1: Total de personas vacunadas (cédulas únicas)
SELECT COUNT(DISTINCT cedula) AS total_personas_vacunadas
FROM final.vacunados_oficial; --980.697

-- CONSULTA 2: Personas que recibieron más de una dosis (cédulas repetidas)
SELECT cedula,
       COUNT(*) AS total_dosis_registradas
FROM final.vacunados_oficial
GROUP BY cedula
HAVING COUNT(*) > 1
ORDER BY total_dosis_registradas DESC;

-- CONSULTA 3: Cédulas con nombre y apellido y total de dosis por persona (detalle adicional)
SELECT cedula,
       nombre,
       apellido,
       COUNT(*) AS total_dosis_registradas
FROM final.vacunados_oficial
GROUP BY cedula, nombre, apellido
HAVING COUNT(*) > 1
ORDER BY total_dosis_registradas DESC;

-- CONSULTA 4: Total de dosis aplicadas por tipo de vacuna
SELECT vac.descripcion AS tipo_de_vacuna,
       COUNT(*) AS total_dosis_aplicadas
FROM final.vacunados_oficial vo
JOIN final.vacunas vac ON vo.vacuna_id = vac.id
GROUP BY vac.descripcion
ORDER BY total_dosis_aplicadas DESC;

---Pfizer	    578.044
---AstraZeneca	261.643
---Sputnik V	124.989
---Moderna	    23.553
---Coronavac	7.488
---Hayat Vax	2.302
---Covaxin	    1.390
---Sinopharm	392



-- CONSULTA 5: Total de dosis aplicadas por establecimiento
SELECT est.descripcion AS establecimiento,
       COUNT(*) AS total_dosis_aplicadas
FROM final.vacunados_oficial vo
JOIN final.establecimientos est ON vo.establecimiento_id = est.id
GROUP BY est.descripcion
ORDER BY total_dosis_aplicadas DESC;

-- CONSULTA: Total de dosis aplicadas por mes y año, ordenado cronológicamente
SELECT 
    EXTRACT(YEAR FROM fecha_aplicacion) AS anho,
    EXTRACT(MONTH FROM fecha_aplicacion) AS mes_num,
    TO_CHAR(fecha_aplicacion, 'TMMonth') AS mes_nombre,
    COUNT(*) AS total_dosis_aplicadas
FROM final.vacunados_oficial
GROUP BY anho, mes_num, mes_nombre
ORDER BY anho, mes_num;


SELECT total_dosis_registradas, COUNT(*) AS cantidad_personas
FROM (
    SELECT cedula, COUNT(*) AS total_dosis_registradas
    FROM final.vacunados_oficial
    GROUP BY cedula
) sub
GROUP BY total_dosis_registradas
ORDER BY total_dosis_registradas;




