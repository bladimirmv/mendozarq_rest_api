import { isValidJwt } from './../../middlewares/jwt';
import { isValidRole } from './../../middlewares/roles';

import { Socket } from "socket.io";

export async function proyectos(socket: Socket, token: string) {
	if (token) {
		const { status, jwtPayload } = isValidJwt(token);
		if (status && await isValidRole(jwtPayload, ['administrador'])) {
			console.log('Succes Auth token and Role validator');
			socket.emit('WS:proyectos', 'First value');
		}
		console.log('🙁 No autorizado');
	}
	console.log('Por favor ingrese el token');
}