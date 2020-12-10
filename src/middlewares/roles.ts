import { Usuario, Roles } from './../models/usuario.interface';
import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';

import config from './../config/config';
import { connect } from './../database';

export const checkRole = (roles: Array<Roles>) => {
	return async (req: Request, res: Response, next: NextFunction) => {
		const { uuid } = res.locals.jwtPayload;
		try {
			const conn = await connect();
			const usuario = await conn.query('select * from usuario where uuid = ?', [uuid]);
			if (usuario[0].length) {
				const usr: Usuario[] = usuario[0];
				const { rol }: Usuario = usr[0];
				// check rol
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
