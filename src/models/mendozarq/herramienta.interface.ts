export interface Herramienta {
	uuid?: string;
	creadoEn?: Date;
	nombre: string;
	categoria: 'maquina' | 'manual' | 'otro';
	urlImg?: string;
	filerefImg?: string;
	descripcion?: string;
	estado?: boolean;
}