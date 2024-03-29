export type Path = 'root' | 'folder';

export interface CarpetaProyecto {
	uuid: string;
	creadoEn: Date;
	nombre: string;
	fechaCreacion: Date;
	uuidProyecto: string;
}

export interface DocumentoProyecto {
	uuid: string;
	creadoEn: Date;
	nombre: string;
	keyName: string;
	location: string;
	fechaCreacion: Date;
	uuidProyecto: string;
	size?: number;
	path?: Path;
}

export interface DocumentoCarpeta {
	uuid: string;
	uuidDocumento: string;
	uuidCarpeta: string;
}


export interface DocumentoProyCarpeta extends DocumentoProyecto {
	uuidCarpeta?: string;
}