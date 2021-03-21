import { Usuario } from "../auth/usuario.interface";

export interface ParticipanteVisita {
	uuid?: string;
	creadoEn?: Date;
	uuidVisitaProyecto: string;
	uuidUsuario: string;
}

export interface UsuarioVisita extends Usuario {
	uuidParticipanteVisita: string;
}