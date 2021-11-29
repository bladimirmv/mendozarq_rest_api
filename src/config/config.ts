import { PoolOptions } from 'mysql2';

const dbOptions: PoolOptions = {
	host: 'localhost',
	port: 3306,
	user: 'root',
	password: '',
	database: 'mendozarq',
	connectionLimit: 10
};





export default {
	jwtSecret: process.env.JWT_SECRET || 'mendozarqbmvliraki',
	dbOptions
};