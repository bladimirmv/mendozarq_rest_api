export type Roles = 'administrador' | 'arquitecto' | 'cliente' | 'vendedor' | 'ninguno';
export interface Usuario {
	uuid?: string;
	creadoEn?: Date;
	nombre?: string;
	apellidoPaterno?: string;
	apellidoMaterno?: string;
	celular?: number;
	direccion?: string;
	correo?: string;
	username?: string;
	contrasenha?: string;
	rol?: Roles;
	activo?: boolean;
	autoUsuario?: boolean;
	autoContrasenha?: boolean;
}


export interface TokenUsuario {
	uuid?: string;
	username?: string;
	rol?: Roles;
}