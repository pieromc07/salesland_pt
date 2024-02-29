import { request, response } from "express";
import { validateLead } from "../helper.js";
import { cargarCampana, cargarLead, disociarLead } from "../service/LeadService.js";



export const altaLead = async (req = request, res = response) => {
  const { body } = req;
  const { campana, telefono, cod_proveedor } = body;
  const validated = validateLead(body);

  if(validated.status){
    const newLead = await cargarLead(body);
    if(newLead.status){
      const mCampana = await cargarCampana(campana);
      if(mCampana.status){
        const { activo, IDENT } = mCampana.data;
        if(activo === 0){
          res.status(500).json({
            "CAMPANA": campana,
            "RESULTADO": "KO: " + 'Campaña Inactiva',
            "TELEFONO": telefono
          });
          return;
        }
        await disociarLead(IDENT, process.env.CLAVEENCRIPTACION, newLead.data, campana, cod_proveedor);
      }
      res.status(200).json({
        "CAMPANA": campana,
        "RESULTADO": "OK",
        "TELEFONO": telefono
      });
      
    }
    else{
      res.status(500).json({
        "CAMPANA": campana,
        "RESULTADO": "KO: " + 'Error Interno',
        "TELEFONO": telefono
      });
    }
  }else{
    res.status(400).json({
      "CAMPANA": campana,
      "RESULTADO": "KO: " + validated.message,
      "TELEFONO": telefono
    });
  }
}

export const moverLead = async (req = request, res = response) => {
  console.log("moverLead");
  res.json({ message: "moverLead" });
}

