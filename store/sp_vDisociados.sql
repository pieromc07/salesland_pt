
USE salesland;
DROP PROCEDURE IF EXISTS sp_vDisociados;

DELIMITER $$
CREATE PROCEDURE sp_vDisociados ()
BEGIN

  CREATE OR REPLACE VIEW vWS_LEADS_DISOCIADOS AS SELECT 
    IDENT_ORI,idTimeStamp, IdUnico, FECHA_ENTRADA, duplicado,cod_proveedor, id, campana, fecha_captacion, nombre, ape1, ape2, telefono,email,acepta1, acepta2, acepta3, num1, num2, num3, dual1, dual2, dual3, variable1, variable2, variable3, memo, fecha, hora, foto1, foto2, comercial, centro, codigo_postal,direccion, poblacion, provincia,nif, cargado, fecha_carga, fecha_disociado, 
    AES_DECRYPT(nombre_enc, 'clave') AS nombre_enc,
    AES_DECRYPT(ape1_enc, 'clave') AS ape1_enc,
    ape2_enc, AES_DECRYPT(telefono_enc, 'clave') AS telefono_enc,AES_DECRYPT(email_enc, 'clave') AS email_enc,
    variable1_enc, variable2_enc, variable3_enc, memo_enc, foto1_enc, foto2_enc, codigo_postal_enc, AES_DECRYPT(direccion_enc, 'clave') AS direccion_enc,poblacion_enc, provincia_enc, 
    AES_DECRYPT(nif_enc, 'clave') AS nif_enc 
    FROM ws_leads_disociados;
END$$

