export type Estado = 'En curso' | 'Pendiente' | 'Fecha limite' | 'Aprobar' | 'Con retraso' | 'Finalizado';

export interface ObservacionObra {
	uuid?: string;
	creadoEn?: Date;
	estado?: Estado;
	fecha?: Date;
	descripcion?: string;
	uuidVisita: string;
}