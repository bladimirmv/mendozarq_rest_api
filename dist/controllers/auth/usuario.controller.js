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
exports.deleteUsuario = exports.updateUsuario = exports.getAllUsuarios = exports.getUsuario = exports.addUsuario = void 0;
const generate_password_1 = __importDefault(require("generate-password"));
const bcrypt_1 = __importDefault(require("bcrypt"));
const uuid_1 = require("uuid");
const database_1 = require("../../database");
// ===================================================================================================
function generateUsuario(usuario) {
    var _a;
    usuario.username = `${generate_password_1.default.generate({ length: 2, numbers: true })}_${(_a = usuario.nombre) === null || _a === void 0 ? void 0 : _a.replace(/\s/g, '.')}${generate_password_1.default.generate({ length: 3, numbers: true })}`;
    return usuario;
}
function generateContrasenha(usuario) {
    usuario.contrasenha = generate_password_1.default.generate({ length: 10, numbers: true });
    return usuario;
}
function addUsuario(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            let usuario = req.body;
            let { contrasenha, username } = usuario;
            if (usuario.autoUsuario && usuario.nombre) {
                usuario = generateUsuario(usuario);
                username = usuario.username;
            }
            if (usuario.autoContrasenha) {
                usuario = generateContrasenha(usuario);
                contrasenha = usuario.contrasenha;
            }
            if (!usuario.contrasenha || !usuario.username || !usuario.rol || !usuario.nombre) {
                return res.status(400).json({
                    message: 'Por favor ingrese los campos requeridos.',
                    error: '400',
                    body: usuario
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
                conn.end();
                return res.status(400).json({
                    message: `El username \'${usuario.username}\' ya esta en uso, porfavor ingrese otro valido o active la opcion de generar automaticamente.`,
                    error: 'Bad request 400'
                });
            }
            else {
                delete usuario.autoUsuario;
                delete usuario.autoContrasenha;
                // adding usuario
                yield conn.query('INSERT INTO usuario SET ?', [usuario]);
                conn.end();
                // adding contrasenha and usuario
                usuario.username = username;
                usuario.contrasenha = contrasenha;
                // response
                return res.status(201).send(usuario);
            }
        }
        catch (error) {
            return res.status(400).json({
                message: 'Ocurrio un error.',
                error
            });
        }
    });
}
exports.addUsuario = addUsuario;
// ===================================================================================================
function getUsuario(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('select  * from usuario where uuid = ?', [uuid]);
            conn.end();
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontro el usuario.',
                    error: '404'
                });
            }
        }
        catch (error) {
            return res.status(400).json({
                message: 'Ocurrio un error',
                error
            });
        }
    });
}
exports.getUsuario = getUsuario;
// ===================================================================================================
function getAllUsuarios(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const usuarios = yield conn.query('select * from usuario order by creadoEn desc');
            conn.end();
            return res.send(usuarios[0]);
        }
        catch (error) {
            return res.status(400).json({
                message: 'Ocurrio un error.',
                error
            });
        }
    });
}
exports.getAllUsuarios = getAllUsuarios;
function updateUsuario(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            let usuario = req.body;
            let { contrasenha, username } = usuario;
            if (usuario.autoUsuario && usuario.nombre) {
                usuario = generateUsuario(usuario);
                username = usuario.username;
            }
            if (usuario.autoContrasenha) {
                usuario = generateContrasenha(usuario);
                contrasenha = usuario.contrasenha;
            }
            if (!usuario.username || !usuario.rol || !usuario.nombre) {
                return res.status(400).json({
                    message: 'Por favor ingrese los campos requeridos.',
                    error: '400',
                    body: usuario
                });
            }
            // encrypting contrasenha
            if (contrasenha) {
                const salt = yield bcrypt_1.default.genSalt(10);
                const hash = yield bcrypt_1.default.hash(usuario.contrasenha, salt);
                usuario.contrasenha = hash;
            }
            // checking username
            const findUsername = yield conn.query('select * from usuario where username = ?', [usuario.username]);
            const usr = findUsername[0][0];
            if (findUsername[0].length && usr.uuid !== uuid) {
                conn.end();
                return res.status(400).json({
                    message: `El username \'${usuario.username}\' ya esta en uso, porfavor ingrese otro valido o active la opcion de generar automaticamente.`,
                    error: 'Bad request 400'
                });
            }
            else {
                delete usuario.autoUsuario;
                delete usuario.autoContrasenha;
                // updating usuario
                console.log('esty insertando esto: ', usuario);
                yield conn.query('update usuario set ? where uuid = ?', [usuario, uuid]);
                conn.end();
                // adding contrasenha and usuario
                usuario.username = username;
                usuario.contrasenha = contrasenha;
                // response
                return res.status(201).send(usuario);
            }
            // await conn.query('update usuario set ? where id = ?', [usuario, uuid]);
            // return res.json({
            // 	message: 'post updated'
            // });
        }
        catch (error) {
            return res.status(400).json({
                message: 'Ocurrio un error.',
                error
            });
        }
    });
}
exports.updateUsuario = updateUsuario;
function deleteUsuario(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from usuario where uuid = ?', [id]);
        return res.json({
            message: 'post deleted'
        });
    });
}
exports.deleteUsuario = deleteUsuario;
