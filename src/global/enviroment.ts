import { PoolOptions } from 'mysql2';

export const SERVER_PORT: number = Number(process.env.PORT) || 3000;

export const AWS_S3: {
	accessKeyId: string;
	secretAccessKey: string;
	Bucket: string;
} = {
	accessKeyId: 'AKIA5D4TA3BXI5RGEODX',
	secretAccessKey: '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',
	Bucket: 'mendozarq-liraki'
};

export const dbOptions: PoolOptions = process.env.dbOptions as PoolOptions || {
	host: 'localhost',
	port: 3306,
	user: 'root',
	password: '',
	database: 'mendozarq',
	connectionLimit: 10
};


export const jwtSecret: string = String(process.env.JWT_SECRET) || 'mendozarqbmvliraki'