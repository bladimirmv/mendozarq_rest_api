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
exports.login = exports.createUsuario = void 0;
const database_1 = require("./../database");
const bcrypt_1 = __importDefault(require("bcrypt"));
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const uuid_1 = require("uuid");
const config_1 = __importDefault(require("./../config/config"));
function createToken(usuario) {
    return jsonwebtoken_1.default.sign({ uuid: usuario.uuid, username: usuario.username }, config_1.default.jwtSecret, {
        expiresIn: 86400
    });
}
function createUsuario(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const usuario = req.body;
            if (!usuario.contrasenha || !usuario.username || !usuario.rol) {
                return res.status(400).json({
                    message: 'Por favor ingrese los campos requeridos.',
                    data: usuario
                });
            }
            // encrypting contrasenha
            const salt = yield bcrypt_1.default.genSalt(10);
            const hash = yield bcrypt_1.default.hash(usuario.contrasenha, salt);
            usuario.contrasenha = hash;
            // generate uuid
            usuario.uuid = uuid_1.v4();
            // checking username
            const findUsername = yield conn.query('select username from usuario where username = ?', [usuario.username]);
            if (findUsername[0].length) {
                return res.status(400).json({
                    message: 'El nombre de usuario ya esta en uso.',
                });
            }
            else {
                yield conn.query('INSERT INTO usuario SET ?', [usuario]);
                return res.status(201).json({
                    message: 'Usuario creado correctamente.',
                    data: usuario
                });
            }
        }
        catch (error) {
            return res.status(400).json({
                message: error
            });
        }
    });
}
exports.createUsuario = createUsuario;
function login(req, res, next) {
    return __awaiter(this, void 0, void 0, function* () {
        // res.send('hola');
        try {
            const conn = yield database_1.connect();
            const credenciales = req.body;
            if (!credenciales.contrasenha || !credenciales.username) {
                return res.status(400).json({
                    message: 'Por favor ingrese su nombre de usuario y contrasenha.',
                    data: credenciales
                });
            }
            let findUsername = yield conn.query('select * from usuario where username = ?', [credenciales.username]);
            const usuario = findUsername[0];
            if (!findUsername[0].length) {
                return res.status(400).json({
                    message: 'El usuario no existe.',
                });
            }
            // comparing contrasenha
            const isMatch = yield bcrypt_1.default.compare(credenciales.contrasenha, usuario[0].contrasenha);
            if (isMatch) {
                return res.status(200).json({
                    message: 'Inicio de sesion correcto.',
                    token: createToken(usuario[0]),
                    data: usuario[0]
                });
            }
            return res.status(400).json({
                message: "El correo o la contraseña son incorrectas"
            });
        }
        catch (error) {
            return res.status(400).json({
                message: error
            });
        }
    });
}
exports.login = login;
