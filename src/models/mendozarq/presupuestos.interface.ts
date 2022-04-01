export interface PresupuestoObra {
  uuid?: string;
  creadoEn?: Date;
  nombre?: string;
  descripcion?: string;
  fecha?: Date;
  iva?: number;
  total?: number;
  uuidCliente: string;
  uuidUsuario: string;
}

export interface PresupuestoObraView extends PresupuestoObra {
  cliente: string;
  usuario: string;
}

export interface CapituloPresupuesto {
  uuid?: string;
  creadoEn?: Date;
  nombre?: string;
  numero?: number;
  descuento?: number;
  total?: number;
  uuidPresupuestoObra?: string;
}

export interface DetalleCapitulo {
  uuid?: string;
  creadoEn?: Date;
  descripcion?: string;
  unidad?: string;
  cantidad?: number;
  precioUnitario?: number;
  total?: number;
  uuidCapituloPresupuesto?: string;
}

export interface CapituloPresupuestoView extends CapituloPresupuesto {
  detalles?: Array<DetalleCapitulo>;
  totalDescuento?: number;
  precio?: number;
}

export interface PresupuestoDTO extends PresupuestoObraView {
  capitulos?: Array<CapituloPresupuestoView>;
}

export interface CapituloDetalleProyecto {
  uuid?: string;
  nombre?: string;
  descuento?: number;
  descripcion?: string;
  unidad?: string;
  cantidad?: number;
  precioUnitario?: number;
}
