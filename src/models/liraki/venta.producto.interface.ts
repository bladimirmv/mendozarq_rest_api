import { Usuario } from '../auth/usuario.interface';

export type tipoVenta = 'online' | 'fisica';
export type metodoPago = 'efectivo' | 'paypal';

export interface Venta {
  uuid: string;
  creadoEn?: Date;
  uuidCliente: string;
  uuidVendedor?: string;
  tipoVenta: tipoVenta;
  metodoPago: metodoPago;
}

export interface DetalleVentaProducto {
  uuid: string;
  creadoEn?: Date;
  uuidVentaProducto: string;
  uuidProducto: string;
  cantidad: number;
  precio: number;
}

export interface VentaProducto extends Venta {
  detalleVenta: DetalleVentaProducto;
}

export interface VentaView extends VentaProducto {
  cliente: Usuario;
  vendedor: Usuario;
}
