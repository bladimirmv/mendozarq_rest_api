"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.checkRole = void 0;
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const config_1 = __importDefault(require("./../config/config"));
const database_1 = require("./../database");
exports.checkRole = (roles) => {
    return (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const authHeader = req.headers['authorization'];
        const token = authHeader && authHeader.split(' ')[1];
        try {
            jsonwebtoken_1.default.verify(token, config_1.default.jwtSecret, (error, payload) => __awaiter(void 0, void 0, void 0, function* () {
                const conn = yield database_1.connect();
                const usuario = yield conn.query('select * from usuario where uuid = ?', [payload.uuid]);
                if (error) {
                    return res.sendStatus(403).json({ error });
                }
                if (usuario[0].length) {
                    const { rol } = usuario[0];
                    if (roles.includes(rol)) {
                        next();
                    }
                    else {
                        res.status(401).json({
                            message: 'Not Authorized',
                            rol
                        });
                    }
                }
            }));
        }
        catch (error) {
            return res.status(400).json({
                message: 'Ocurrio un error',
                error
            });
        }
    });
};
