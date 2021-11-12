export interface ComentarioProducto {
	uuid: string;
	creadoEn: Date;
	titulo: string;
	descripcion: string;
	estado: boolean;
	verificado: boolean;
	puntuacion: number;
	uuidProducto: string;
	uuidCliente: string;
}