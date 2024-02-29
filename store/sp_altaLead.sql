-- Active: 1706537209506@@127.0.0.1@3306@salesland
USE salesland;
DROP PROCEDURE IF EXISTS sp_altaLead;

DELIMITER $$
CREATE PROCEDURE sp_altaLead(
    IN cod_proveedord VARCHAR(5),
    IN idd VARCHAR(50),
    IN campanad VARCHAR(50),
    IN fecha_captaciond VARCHAR(50),
    IN nombred VARCHAR(50),
    IN ape1d VARCHAR(50),
    IN ape2d VARCHAR(50),
    IN nifd VARCHAR(50),
    IN telefonod VARCHAR(50),
    IN emaild VARCHAR(50),
    IN direcciond VARCHAR(50),
    IN codigo_postald VARCHAR(10),
    IN poblaciond VARCHAR(50),
    IN provinciad VARCHAR(50),
    IN acepta1d VARCHAR(5),
    IN acepta2d VARCHAR(5),
    IN acepta3d VARCHAR(5),
    IN num1d VARCHAR(5),
    IN num2d VARCHAR(5),
    IN num3d VARCHAR(5),
    IN dual1d VARCHAR(5),
    IN dual2d VARCHAR(5),
    IN dual3d VARCHAR(5),
    IN variable1d VARCHAR(50),
    IN variable2d VARCHAR(50),
    IN variable3d VARCHAR(50),
    IN memod TEXT,
    IN fechad DATE,
    IN horad TIME,
    IN foto1d TEXT,
    IN foto2d TEXT,
    IN comerciald VARCHAR(50),
    IN centrod VARCHAR(50)
)
BEGIN
    DECLARE idLead INT;
    DECLARE IdUnico VARCHAR(100);
    DECLARE idTimeStamp VARCHAR(50);
    DECLARE FECHA_ENTRADA DATETIME;
    DECLARE duplicado INT;
    DECLARE cargado INT;
    DECLARE fecha_carga DATETIME;
    SELECT IDENT INTO idLead FROM WS_LEADS ORDER BY IDENT DESC LIMIT 1;
    IF idLead IS NULL THEN
        SET idLead = 1;
    ELSE
        SET idLead = idLead + 1;
    END IF;
    SET IdUnico = CONCAT(cod_proveedord, 'CAP', RIGHT(CONCAT('000000000', CAST(idLead AS CHAR)), 9));
    SET idTimeStamp = DATE_FORMAT(NOW(), '%Y%m%d%H%i%s');
    SET FECHA_ENTRADA = NOW();
    SET cargado = 1;
    SET fecha_carga = NOW();

    SELECT COUNT(*) INTO duplicado FROM WS_LEADS WHERE campana = campana AND id = id;

    INSERT INTO WS_LEADS (idTimeStamp, IdUnico, FECHA_ENTRADA, duplicado, cargado, fecha_carga, cod_proveedor, id, campana, fecha_captacion, nombre, ape1, ape2, nif, telefono, email, direccion, codigo_postal, poblacion, provincia, acepta1, acepta2, acepta3, num1, num2, num3, dual1, dual2, dual3, variable1, variable2, variable3, memo, fecha, hora, foto1, foto2, comercial, centro)
    VALUES (idTimeStamp, IdUnico, FECHA_ENTRADA, duplicado, cargado, fecha_carga, cod_proveedord, idd, campanad, fecha_captaciond, nombred, ape1d, ape2d, nifd, telefonod, emaild, direcciond, codigo_postald, poblaciond, provinciad, acepta1d, acepta2d, acepta3d, num1d, num2d, num3d, dual1d, dual2d, dual3d, variable1d, variable2d, variable3d, memod, fechad, horad, foto1d, foto2d, comerciald, centrod);

END$$
