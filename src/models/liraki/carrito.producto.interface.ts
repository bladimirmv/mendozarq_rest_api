import { Producto } from './producto.interface';
export interface CarritoProducto {
  uuid: string;
  creadoEn?: Date;
  uuidProducto: string;
  uuidCliente: string;
  cantidad: number;
}

export interface CarritoProductoInline extends Producto {
  uuidCP: string;
  creadoEnCP?: Date;
  uuidProducto: string;
  uuidCliente: string;
  cantidad: number;
  keyName: string;
}

export interface CarritoProductoView extends CarritoProducto {
  producto: { keyName: string } & Producto;
}
