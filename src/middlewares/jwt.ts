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
		return res.status(401).json({ message: 'Acceso no autorizado' });
	}

	const { uuid, username } = jwtPayload;

	const newToken = jwt.sign({ uuid, username }, config.jwtSecret, { expiresIn: '1d' });
	res.setHeader('token', newToken);
	
	// *Call next
	next();
};
