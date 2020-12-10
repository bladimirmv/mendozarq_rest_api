import { createPool, Pool } from 'mysql2/promise';

import config from './config/config'

export async function connect(): Promise<any> {
	try {
		const connection: Pool = await createPool(config.dbOptions);
		return connection;

	} catch (error) {
		console.log('Ocurrio un error: ', error);

	}

}

