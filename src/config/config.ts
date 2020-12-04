export default {
	s3options: {
		accessKeyId: 'AKIA5D4TA3BXGXGH6TX3',
		secretAccessKey: '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'
	},
	jwtSecret: process.env.JWT_SECRET || 'mendozarqbmvliraki',

	database: {
		host: 'localhost',
		port: 3306,
		user: 'root',
		password: '',
		database: 'mendozarq',
		// connectionLimit: 10
	}
};