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
exports.deleteProyecto = exports.updateProyecto = exports.getAllProyectos = exports.getProyecto = exports.addProyecto = void 0;
const uuid_1 = require("uuid");
const database_1 = require("./../database");
// ===================================================================================================
function addProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const Proyecto = req.body;
            // generate uuid
            Proyecto.idProyecto = uuid_1.v4();
            yield conn.query('INSERT INTO proyecto SET ?', [Proyecto]);
            return res.status(201).json({
                message: 'Proyecto creado correctamente.',
                body: Proyecto
            });
        }
        catch (error) {
            return res.status(400).json({
                message: 'Ocurrio un error.',
                error
            });
        }
    });
}
exports.addProyecto = addProyecto;
// ===================================================================================================
function getProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('select  * from proyecto where idProyecto = ?', [uuid]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontro el proyecto solicitado.',
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
exports.getProyecto = getProyecto;
// ===================================================================================================
function getAllProyectos(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const usuarios = yield conn.query('select * from proyecto order by creadoEn;');
            return res.json(usuarios[0]);
        }
        catch (error) {
            return res.status(400).json({
                message: 'Ocurrio un error.',
                error
            });
        }
    });
}
exports.getAllProyectos = getAllProyectos;
function updateProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = req.body;
            delete usuario.idProyecto;
            // checking username
            const findUsername = yield conn.query('select nombre from proyecto where nombre = ?', [usuario.nombre]);
            if (findUsername[0].length) {
                return res.status(400).json({
                    message: 'El proyecto insertada ya existe.',
                });
            }
            else {
                // adding usuario
                yield conn.query('UPDATE proyecto SET ? WHERE idProyecto = ?', [usuario, usuario.idProyecto]);
                return res.status(201).json({
                    message: 'Proyecto modificado correctamente.',
                    body: usuario
                });
            }
            // await conn.query('update usuario set ? where id = ?', [usuario, uuid]);
            // return res.json({
            // 	message: 'post updated'
            // });
        }
        catch (error) {
        }
    });
}
exports.updateProyecto = updateProyecto;
function deleteProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from proyecto where id = ?', [id]);
        return res.json({
            message: 'Proyecto eliminado existosamente!'
        });
    });
}
exports.deleteProyecto = deleteProyecto;
