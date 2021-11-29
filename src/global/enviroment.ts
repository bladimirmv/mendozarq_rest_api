import { PoolOptions } from 'mysql2';

export const SERVER_PORT: number = Number(process.env.PORT) || 3000;

export const AWS_S3: {
	accessKeyId: string;
	secretAccessKey: string;
	Bucket: string;
} = {
	accessKeyId: 'AKIAS5TJVX4USELPVU5Q',
	secretAccessKey: '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',
	Bucket: 'mendozarq-liraki-s3'
};


export const PAYPAL_API_CLIENT: string = 'AcJ1FfC1csSTMtiouf76c5z3xA6yAUMqtv88oG5j68ewNhd4RelzysAD8-yFB2p_wQfi5Z-qVQP23YGM';
export const PAYPAL_API_SECRET: string = 'ENWNqW3NUHL2-26CvsjfY2ZNHvpAgmuNvsczhMCCkgQ1GbWTHVpZMMmfNmbt50HhJppGVmHmIdNqwQzs';
export const PAYPAL_API: string = 'https://api-m.sandbox.paypal.com';

export const dbOptions: PoolOptions = process.env.dbOptions as PoolOptions || {
	host: 'localhost',
	port: 3306,
	user: 'root',
	password: '',
	database: 'mendozarq',
	connectionLimit: 10
};


export const jwtSecret: string = String(process.env.JWT_SECRET) || 'mendozarqbmvliraki'