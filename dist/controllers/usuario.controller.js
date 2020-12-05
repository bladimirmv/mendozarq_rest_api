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
const database_1 = require("./../database");
function addUsuario(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            // const conn = await connect();
            const usuario = req.body;
            console.log(req.body);
            if (usuario.generarCredenciales === true) {
                usuario.contrasenha = generate_password_1.default.generate({ length: 10, numbers: true });
                console.log('se genero');
                console.log('ss', usuario);
                return res.send(usuario);
            }
            else {
                return res.send({ usuario, esta: 'no funciono' });
            }
            // if (!usuario.contrasenha || !usuario.username || !usuario.rol) {
            // 	return res.status(400).json({
            // 		message: 'Por favor ingrese los campos requeridos.',
            // 		data: usuario
            // 	});
            // }
            // // encrypting contrasenha
            // const salt = await bcrypt.genSalt(10);
            // const hash = await bcrypt.hash(usuario.contrasenha, salt);
            // usuario.contrasenha = hash;
            // // generate uuid
            // usuario.uuid = uuid();
            // // checking username
            // const findUsername = await conn.query('select username from usuario where username = ?', [usuario.username]);
            // if (findUsername[0].length) {
            // 	return res.status(400).json({
            // 		message: 'El nombre de usuario ya esta en uso.',
            // 	});
            // } else {
            // 	await conn.query('INSERT INTO usuario SET ?', [usuario]);
            // 	return res.status(201).json({
            // 		message: 'Usuario creado correctamente.',
            // 		data: usuario
            // 	});
            // }
        }
        catch (error) {
            return res.status(400).json({
                message: error
            });
        }
    });
}
exports.addUsuario = addUsuario;
function getUsuario(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        const post = yield conn.query('select  * from posts where id = ?', [id]);
        return res.json(post[0]);
    });
}
exports.getUsuario = getUsuario;
function getAllUsuarios(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const posts = yield conn.query('select  * from posts;');
            return res.json(posts[0]);
        }
        catch (error) {
            return error;
        }
    });
}
exports.getAllUsuarios = getAllUsuarios;
function updateUsuario(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        // const id = req.params.id;
        // const conn = await connect();
        // const data: post = req.body;
        // await conn.query('update posts set ? where id = ?', [data, id]);
        // return res.json({
        // 	message: 'post updated'
        // });
    });
}
exports.updateUsuario = updateUsuario;
function deleteUsuario(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from posts where id = ?', [id]);
        return res.json({
            message: 'post deleted'
        });
    });
}
exports.deleteUsuario = deleteUsuario;
