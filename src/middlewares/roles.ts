import { Usuario, Roles } from './../models/usuario.interface';
import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';

import config from './../config/config';
import { connect } from './../database';

export const checkRole = (roles: Array<Roles>) => {
	return async (req: Request, res: Response, next: NextFunction) => {

		const authHeader = req.headers['authorization'];
		const token = authHeader && authHeader.split(' ')[1];

		try {

			jwt.verify(token as string, config.jwtSecret, async (error: any, payload: any) => {

				const conn = await connect();
				const usuario = await conn.query('select * from usuario where uuid = ?', [payload.uuid]);
				if (error) {
					return res.sendStatus(403).json({ error })
				}
				if (usuario[0].length) {
					const { rol }: Usuario = usuario[0];
					if (roles.includes(rol as Roles)) {
						next();
					} else {
						res.status(401).json({
							message: 'Not Authorized',
							rol
						});
					}
				}
			});

		} catch (error) {
			return res.status(400).json({
				message: 'Ocurrio un error',
				error
			});
		}
	};
};
