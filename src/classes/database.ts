import { createPool, Pool } from 'mysql2/promise';
import config from './../config/config'

let globalPool: Pool | undefined = undefined;

export async function connect(): Promise<Pool> {
	if (globalPool) {
		return globalPool;
	}

	globalPool = await createPool(config.dbOptions);
	return globalPool;
}