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
Object.defineProperty(exports, "__esModule", { value: true });
exports.checkRole = void 0;
const database_1 = require("./../database");
exports.checkRole = (roles) => {
    return (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
        const { uuid } = res.locals.jwtPayload;
        try {
            const conn = yield database_1.connect();
            const usuario = yield conn.query('select * from usuario where uuid = ?', [uuid]);
            if (usuario[0].length) {
                const usr = usuario[0];
                const { rol } = usr[0];
                // check rol
                roles.includes(rol)
                    ? next()
                    : res.status(401).json({
                        message: 'Acceso no autorizado',
                        error: '401'
                    });
            }
        }
        catch (e) {
            return res.status(401).json({ message: 'Acceso no autorizado' });
        }
    });
};
