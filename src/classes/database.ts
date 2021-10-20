import { createPool, Pool } from 'mysql2/promise';
import { dbOptions } from './../global/enviroment'

let globalPool: Pool | undefined = undefined;

export async function connect(): Promise<Pool> {
	if (globalPool) return globalPool;

	globalPool = await createPool(dbOptions);
	return globalPool;
}