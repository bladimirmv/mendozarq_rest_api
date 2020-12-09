export interface SubDetallePresupuesto {
    idSubDetallePresupuesto?: string;
    creadoEn?: Date;
    nombre: string;
    medida: string;
    cantidad: number;
    precioUnitario: number;
    totalSubDetalle?: number;
    idDetallePresupuesto?: string;
  }
  