import { PoolOptions } from 'mysql2';
import { config } from 'dotenv';
config();

export const SERVER_PORT: number = Number(process.env.PORT) || 3000;

export const CLIENT_URL: string = (process.env.CLIENT_URL as string) || 'http://localhost:4200';
export const HOST_API: string = (process.env.HOST_API as string) || 'http://localhost:3000';

export const AWS_S3: {
  accessKeyId: string;
  secretAccessKey: string;
  Bucket: string;
} = {
  accessKeyId: process.env.accessKeyId as string,
  secretAccessKey: process.env.secretAccessKey as string,
  Bucket: process.env.Bucket as string,
};

export const PAYPAL_API_CLIENT: string = process.env.PAYPAL_API_CLIENT as string;
export const PAYPAL_API_SECRET: string = process.env.PAYPAL_API_SECRET as string;
export const PAYPAL_API: string = 'https://api-m.sandbox.paypal.com';

export const dbOptions: PoolOptions = (process.env.dbOptions as PoolOptions) || {
  host: 'localhost',
  port: 3306,
  user: 'root',
  password: '',
  database: 'mendozarq',
  connectionLimit: 10,
};

export const jwtSecret: string = String(process.env.JWT_SECRET) || 'mendozarqbmvliraki';
