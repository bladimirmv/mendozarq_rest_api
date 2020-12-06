export interface Proyecto {
    idProyecto?: string;
    creadoEn?: Date;
    nombre: string;
    descripcion?: string;
    // categoria?: any[];
    estado: boolean;
    fechaInicio?: any;
    fechaFinal?: any;
    lugarProyecto?: string;
    filerefCont?: string;
    urlCont?: string;
    idCliente: any;
    // nombreCliente?: string; //ya no lo necesitariamos, con querys lo recuperariamos de su tabla
    porcentaje?: number;
  }