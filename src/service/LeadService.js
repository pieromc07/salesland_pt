import dotenv from 'dotenv';
dotenv.config();
import cron from 'node-cron';
import {pool} from "../dbconection.js";
import { getTimestamp } from "../helper.js";

export const cargarLead = async (lead) => {

  try {
  lead.fecha_captacion = lead.fecha_captacion.split(" ")[0];
    const newLead = await pool.query(`CALL sp_altaLead('${lead.cod_proveedor}',${lead.id},${lead.campana},${lead.fecha_captacion},'${lead.nombre}','${lead.ape1}','${lead.ape2}','${lead.nif}','${lead.telefono}','${lead.email}','${lead.direccion}','${lead.codigo_postal}','${lead.poblacion}','${lead.provincia}','${lead.acepta1}','${lead.acepta2}','${lead.acepta3}','${lead.num1}','${lead.num2}','${lead.num3}','${lead.dual1}','${lead.dual2}','${lead.dual3}','${lead.variable1}','${lead.variable2}','${lead.variable3}','${lead.memo}','${lead.fecha}','${lead.hora}','${lead.foto1}','${lead.foto2}','${lead.comercial}','${lead.centro}')`);

    // obtener el ultimo id insertado en la tabla ws_leads
    const lastId = await pool.query(`SELECT MAX(IDENT) as id FROM ws_leads WHERE cod_proveedor = '${lead.cod_proveedor}' AND id = ${lead.id}`);

    if(newLead)
      return {
        status: true,
        data: lastId[0][0].id
      }
  }
  catch (error) {
    await pool.query(`INSERT INTO log_ws (cuerpo, error, fecha) VALUES ('${JSON.stringify(lead)}', '${error}', '${getTimestamp()}')`);
    return {
      status: false,
      data: error
    }
  }
}


export const cargarCampana = async (campana) => {
  try {
    const newCampana = await pool.query(`SELECT * FROM AUX_CAMPANAS WHERE IDENT = ${campana}`);
    if(newCampana)
      return {
        status: true,
        data: newCampana[0][0]
      }
  }
  catch (error) {
    await pool.query(`INSERT INTO log_ws (cuerpo, error, fecha) VALUES ('${JSON.stringify(campana)}', '${error}', '${getTimestamp()}')`);
    return {
      status: false,
      data: error
    }
  }
};

export const disociarLead = async (ident, clave, idLead, campana, cod_proveedor) => {
  try {
   
    const disociar = await pool.query(`CALL sp_disociar('${ident}', '${clave}', '${idLead}')`);
    const view = await pool.query(`CALL sp_vDisociados()`);
    if(disociar && view)
      return true;
  }
  catch (error) {
    await pool.query(`INSERT INTO logs_carga (IdLead, campana, proveedor, log_texto, comando, fecha) VALUES ('${idLead}', '${campana}', '${cod_proveedor}', '${error}', 'sp_disociar', '${getTimestamp()}')`);
    return false
  }
};



export const recargar = async () => {
  try {
    cron.schedule('*/10 * * * *', async () => {
       console.log('Recargando');
      const recargar = await pool.query(`CALL sp_Recargar()`);
     }, {
      scheduled: true,
      timezone: "America/Lima"
     });
  }
  catch (error) {
    await pool.query(`INSERT INTO log_ws (cuerpo, error, fecha) VALUES ('', '${error}', '${getTimestamp()}')`);
    return false
  }
}