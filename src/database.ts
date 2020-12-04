import { createPool } from 'mysql2/promise';

import config from './config/config'

export async function connect(): Promise<any> {
	const connection = await createPool(config.database);
	connection.once('open', () => {
		console.log('Database connection stablished');

	});
	connection.once('error', err => {
		console.log('Database connection error: ', err);
		process.exit(0);
	});
	return connection;
}

