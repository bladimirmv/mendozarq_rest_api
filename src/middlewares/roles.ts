import { Pool, FieldPacket } from 'mysql2/promise';
import { Usuario, Roles } from './../models/usuario.interface';
import { Request, Response, NextFunction } from 'express';

import { connect } from './../database';

export const checkRole = (roles: Array<Roles>) => {
	return async (req: Request, res: Response, next: NextFunction) => {
		const { uuid } = res.locals.jwtPayload;
		try {
			const conn: Pool = await connect();
			const [[usuario]]: [any[], FieldPacket[]] = await conn.query('select * from usuario where uuid = ?', [uuid]);

			if (usuario) {
				const { rol }: Usuario = usuario;
				// *checking rol
				roles.includes(rol as Roles)
					? next()
					: res.status(401).json({
						message: 'Acceso no autorizado',
						error: '401'
					});
			}
		} catch (e) {
			return res.status(401).json({ message: 'Acceso no autorizado' });
		}

	};
};
