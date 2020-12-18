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
exports.deleteRecurso = exports.updateRecurso = exports.getAllRecursos = exports.getRecurso = exports.addRecurso = void 0;
const uuid_1 = require("uuid");
const database_1 = require("./../database");
// ===================================================================================================
function addRecurso(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const recurso = req.body;
            // generate uuid
            recurso.idRecurso = uuid_1.v4();
            yield conn.query('INSERT INTO recurso SET ?', [recurso]);
            return res.status(201).json({
                message: 'Recurso creado correctamente.',
                body: recurso
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
exports.addRecurso = addRecurso;
// ===================================================================================================
function getRecurso(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('select  * from recurso where idRecurso = ?', [uuid]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontraron recursos con el id ingresado.',
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
exports.getRecurso = getRecurso;
// ===================================================================================================
function getAllRecursos(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const usuarios = yield conn.query('select * from recurso order by creadoEn;');
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
exports.getAllRecursos = getAllRecursos;
function updateRecurso(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const recurso = req.body;
            // delete recurso.idRecurso porque estamos borrando estos id's?
            // adding usuario
            yield conn.query('UPDATE recurso SET ? WHERE idRecurso = ?', [recurso, recurso.idRecurso]);
            return res.status(201).json({
                message: 'Recurso modificado correctamente.',
                body: recurso
            });
            // await conn.query('update usuario set ? where id = ?', [usuario, uuid]);
            // return res.json({
            // 	message: 'post updated'
            // });
        }
        catch (error) {
            return res.status(400).json({
                message: 'Ocurrio un error',
                error
            });
        }
    });
}
exports.updateRecurso = updateRecurso;
function deleteRecurso(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from recurso where idRecurso = ?', [id]);
        return res.json({
            message: 'Recurso eliminado exitosamente'
        });
    });
}
exports.deleteRecurso = deleteRecurso;
