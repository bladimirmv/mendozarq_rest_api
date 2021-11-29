import { PoolOptions } from 'mysql2';

export const SERVER_PORT: number = Number(process.env.PORT) || 3000;

export const AWS_S3: {
	accessKeyId: string;
	secretAccessKey: string;
	Bucket: string;
} = {
	accessKeyId: 'XXX',
	secretAccessKey: 'XXX',
	Bucket: 'XXX'
};


export const PAYPAL_API_CLIENT: string = 'XXX';
export const PAYPAL_API_SECRET: string = 'XXX';
export const PAYPAL_API: string = 'XXX';


export const dbOptions: PoolOptions = process.env.dbOptions as PoolOptions || {
	host: 'localhost',
	port: 3306,
	user: 'root',
	password: '',
	database: 'XXX',
	connectionLimit: 10
};


export const jwtSecret: string = String(process.env.JWT_SECRET) || 'XXX'