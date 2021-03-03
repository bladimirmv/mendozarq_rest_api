export type Estado = 'En curso' | 'Pendiente' | 'Fecha limite' | 'Aprobar' | 'Con retraso' | 'Finalizado';


export interface ObservacionServicio {
	uuid?: string;
	creadoEn?: Date;
	estado?: Estado;
	descripcion?: string;
	fecha?: Date;
	uuidServicio: string;
	uuidVisita: string;
}