import { Usuario } from "../auth/usuario.interface";

export interface Venta {
	uuid: string;
	creadoEn?: Date;
	uuidCliente: string;
	uuidVendedor: string;
}


export interface DetalleVenta {
	uuid: string;
	creadoEn?: Date;
	uuidProducto: string;
	cantidad: number;
	precio: number;
	total: number;
}


export interface VentaView extends Venta {
	cliente: Usuario;
	vendedor: Usuario;
	detalleVenta: DetalleVenta
}
