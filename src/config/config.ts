import { PoolOptions } from 'mysql2';
import aws from 'aws-sdk';
const s3ClientConfiguration: aws.S3.ClientConfiguration = {
	accessKeyId: 'AKIA5D4TA3BXGXGH6TX3',
	secretAccessKey: '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'
};
const dbOptions: PoolOptions = {
	host: 'localhost',
	port: 3306,
	user: 'root',
	password: '',
	database: 'mendozarq',
	connectionLimit: 10000,

};

export default {
	s3ClientConfiguration,
	jwtSecret: process.env.JWT_SECRET || 'mendozarqbmvliraki',
	dbOptions
};