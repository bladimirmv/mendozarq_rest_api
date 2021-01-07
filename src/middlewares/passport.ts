import { Strategy, ExtractJwt, StrategyOptions } from 'passport-jwt';
import { Pool } from 'mysql2/promise';

import config from './../config/config';
import { connect } from './../classes/database';



const options: StrategyOptions = {
	jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
	secretOrKey: config.jwtSecret
};

export default new Strategy(options, async (payload, done) => {
	try {
		const conn: Pool = await connect();
		const usuario: any = await conn.query('select * from usuario where uuid = ?', [payload.uuid]);

		if (usuario[0].length) {
			conn.end();
			return done(null, usuario[0]);
		}
		return done(null, false);
	} catch (error) {
		console.log(error);
	}
});