USE salesland;

DROP PROCEDURE IF EXISTS sp_recargar;

-- sp_Recargar	"Revisa mediante un job ejecutado cada 10 minutos si hay algun registro en WS_LEADS que pueda cargarse. Se usa por si en el momento de cargar en la campaña el servidor de destino se encontraba bajo incidencia que le impidiese responder a la llamada original. Así una vez activo de nuevo, se puede volver a intentar cargar el registro."

DELIMITER $$
CREATE PROCEDURE sp_recargar()
BEGIN
  DECLARE idd VARCHAR(50);
  DECLARE IdCampanaD INTEGER;
  DECLARE clavedeencriptaciond VARCHAR(50);

  SELECT IDENT, campana, 'clave' INTO idd, IdCampanaD, clavedeencriptaciond FROM ws_leads ORDER BY IDENT DESC LIMIT 1;

  IF idd IS NOT NULL THEN
    CALL sp_disociar(IdCampanaD, clavedeencriptaciond, idd);
    CALL sp_vDisociados();
  END IF;
END$$
