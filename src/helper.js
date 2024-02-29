export const validateLead = (lead) => {
  const {
    id, 
    campana, 
    cod_proveedor, 
    fecha_captacion, 
    nombre,
    telefono,
    acepta1,
    comercial
  } = lead;

  if(!id || !campana || !cod_proveedor || !fecha_captacion || !nombre || !telefono || !acepta1 || !comercial) {
    return {
      status: false,
      message: "Faltan campos por llenar"
    }
  }

  if(id.length > 50) {
    return {
      status: false,
      message: "El campo id debe tener máximo 50 caracteres"
    }
  }

  if(isNaN(campana)) {
    return {
      status: false,
      message: "El campo campana debe ser numérico"
    }
  }

  if(cod_proveedor.length !== 5) {
    return {
      status: false,
      message: "El campo cod_proveedor debe tener 5 caracteres"
    }
  }


  if(!/^\d{8} \d{2}:\d{2}$/.test(fecha_captacion)) {
    return {
      status: false,
      message: "El campo fecha_captacion debe tener el formato aaaammdd hh:mm"
    }
  }

  if(nombre.length > 50) {
    return {
      status: false,
      message: "El campo nombre debe tener máximo 50 caracteres"
    }
  }

  if(!/^[6-9]\d{8}$/.test(telefono)) {
    return {
      status: false,
      message: "El campo telefono debe ser un número entero de 9 cifras empezando por 6,7,8 ó 9"
    }
  }

  if(acepta1 !== "SI" && acepta1 !== "NO") {
    return {
      status: false,
      message: "El campo acepta1 debe ser SI o NO"
    }
  }

  if(comercial.length > 50) {
    return {
      status: false,
      message: "El campo comercial debe tener máximo 50 caracteres"
    }
  }

  return {
    status: true,
    message: "Lead validado"
  }
};

export const getTimestamp = () => {
  return  new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T").join(" ").split(".")[0];
}
