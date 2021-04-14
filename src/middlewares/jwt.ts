import { Request, Response, NextFunction } from 'express';
import * as jwt from 'jsonwebtoken';
import config from './../config/config';

export const checkJwt = (req: Request, res: Response, next: NextFunction) => {
	const authHeader = <string>req.headers['authorization'];
	const token = authHeader && authHeader.split(' ')[1];
	let jwtPayload;

	try {
		jwtPayload = <any>jwt.verify(token, config.jwtSecret);
		res.locals.jwtPayload = jwtPayload;
	} catch (e) {
		return res.status(401).json({ message: 'Acceso no autorizado, no tienes permisos para continuar. 🙁' });
	}

	const { uuid, username } = jwtPayload;

	const newToken = jwt.sign({ uuid, username }, config.jwtSecret, { expiresIn: '1d' });
	res.setHeader('token', newToken);

	// *Call next
	next();
};

export const isValidJwt = (token: string): { status?: boolean; jwtPayload?: any; } => {
	try {
		let jwtPayload;
		jwtPayload = <any>jwt.verify(token, config.jwtSecret);
		return jwtPayload ? { status: true, jwtPayload } : { status: false };
	} catch (error) {
		console.log('❌ Ocurrio un error al validar el token: ', error);
	}
	return { status: false };
};
