import { Usuario } from './../models/usuario.interface';
import { Strategy, ExtractJwt, StrategyOptions } from 'passport-jwt';

import config from './../config/config';
import { connect } from './../database';



const options: StrategyOptions = {
	jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
	secretOrKey: config.jwtSecret
};

export default new Strategy(options, async (payload, done) => {
	try {
		const conn = await connect();
		const usuario = await conn.query('select * from usuario where uuid = ?', [payload.uuid]);
		if (usuario[0].length) {
			return done(null, usuario[0]);
		}
		return done(null, false);
	} catch (error) {
		console.log(error);

	}
})