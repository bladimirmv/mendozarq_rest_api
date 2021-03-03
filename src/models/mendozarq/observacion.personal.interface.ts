export type Estado = 'En curso' | 'Pendiente' | 'Fecha limite' | 'Aprobar' | 'Con retraso' | 'Finalizado';

export interface ObservacionPersonal {
	uuid?: string;
	creadoEn?: Date;
	estado?: Estado;
	descripcion?: string;
	uuidPersonal: string;
	uuidVisita: string;
}