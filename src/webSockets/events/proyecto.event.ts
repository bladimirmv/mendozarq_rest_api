import { Roles } from '../../models/auth/usuario.interface';
import { isValidJwt } from './../../middlewares/jwt';
import { isValidRole } from './../../middlewares/roles';

import { Socket } from "socket.io";
import { connect } from './../../classes/database';
import { FieldPacket, Pool } from 'mysql2/promise';

export async function proyectos(socket: Socket, token: string) {
	if (token) {
		const { status, jwtPayload } = isValidJwt(token);
		if (status && await isValidRole(jwtPayload, ['administrador'])) {
			console.log('Succes Auth token and Role validator');
			try {
				const conn: Pool = await connect();
				const [proyectos]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM proyecto ORDER BY creadoEn DESC');

				socket.to('administrador' as Roles).emit('WS:proyectos', proyectos);
			} catch (error) {
				console.log('❌ Ocurrio un error: ', error);
			}
		}
		console.log('🙁 No autorizado');
	}
	console.log('Por favor ingrese el token');
}