"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const s3ClientConfiguration = {
    accessKeyId: 'AKIA5D4TA3BXGXGH6TX3',
    secretAccessKey: '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'
};
const dbOptions = {
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '',
    database: 'mendozarq',
    connectionLimit: 10,
};
exports.default = {
    s3ClientConfiguration,
    jwtSecret: process.env.JWT_SECRET || 'mendozarqbmvliraki',
    dbOptions
};
