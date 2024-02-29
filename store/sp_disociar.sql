

USE salesland;
DROP PROCEDURE IF EXISTS sp_disociar;

DELIMITER $$
CREATE PROCEDURE sp_disociar(
    IN IdCampanaD INTEGER,
    IN clavedeencriptaciond VARCHAR(50),
    IN idd VARCHAR(50)
)
BEGIN

  DECLARE ape1d BLOB;
  DECLARE direcciond BLOB;
  DECLARE emaild BLOB;
  DECLARE nifd BLOB;
  DECLARE nombred BLOB;
  DECLARE telefonod BLOB;


   SELECT ape1, direccion, email, nif, nombre, telefono 
    INTO ape1d, direcciond, emaild, nifd, nombred, telefonod
    FROM ws_leads WHERE IDENT = idd;

    SET ape1d = AES_ENCRYPT(ape1d, clavedeencriptaciond);
    SET direcciond = AES_ENCRYPT(direcciond, clavedeencriptaciond);
    SET emaild = AES_ENCRYPT(emaild, clavedeencriptaciond);
    SET nifd = AES_ENCRYPT(nifd, clavedeencriptaciond);
    SET nombred = AES_ENCRYPT(nombred, clavedeencriptaciond);
    SET telefonod = AES_ENCRYPT(telefonod, clavedeencriptaciond);



    INSERT INTO ws_leads_disociados(IDENT_ORI,idTimeStamp, IdUnico, FECHA_ENTRADA, duplicado,cod_proveedor, id, campana, fecha_captacion, nombre, ape1, ape2, telefono,email,acepta1, acepta2, acepta3, num1, num2, num3, dual1, dual2, dual3, variable1, variable2, variable3, memo, fecha, hora, foto1, foto2, comercial, centro, codigo_postal,direccion, poblacion, provincia,nif, cargado, fecha_carga, fecha_disociado, nombre_enc, ape1_enc, ape2_enc, telefono_enc, email_enc, variable1_enc, variable2_enc, variable3_enc, memo_enc, foto1_enc, foto2_enc, codigo_postal_enc, direccion_enc, poblacion_enc, provincia_enc, nif_enc)
   SELECT IDENT, idTimeStamp, IdUnico, FECHA_ENTRADA, duplicado,cod_proveedor, id, campana, fecha_captacion, nombre, ape1, ape2, telefono,email,acepta1, acepta2, acepta3, num1, num2, num3, dual1, dual2, dual3, variable1, variable2, variable3, memo, fecha, hora, foto1, foto2, comercial, centro, codigo_postal,direccion, poblacion, provincia,nif, 1, NOW(), NOW(), nombred, ape1d, ape2, telefonod, emaild, variable1, variable2, variable3, memo, foto1, foto2, codigo_postal, direcciond, poblacion, provincia, nif FROM ws_leads WHERE IDENT = idd;

    DELETE FROM ws_leads WHERE IDENT = idd;
    
END$$


