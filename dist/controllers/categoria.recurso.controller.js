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
exports.deleteCategriaRecurso = exports.updateCategoriaRecurso = exports.getAllCategoriasRecurso = exports.getCategoriaRecurso = exports.addCategoriaRecurso = void 0;
const uuid_1 = require("uuid");
const database_1 = require("./../database");
// ===================================================================================================
function addCategoriaRecurso(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const categoriaRecurso = req.body;
            // generate uuid
            categoriaRecurso.idCategoriaRecurso = uuid_1.v4();
            yield conn.query('INSERT INTO categoriaRecurso SET ?', [categoriaRecurso]);
            return res.status(201).json({
                message: 'Categoria de recursos creado correctamente.',
                body: categoriaRecurso
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
exports.addCategoriaRecurso = addCategoriaRecurso;
// ===================================================================================================
function getCategoriaRecurso(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('select  * from categoriaRecurso where idCategoriaRecurso = ?', [uuid]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontro la categoria de recurso.',
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
exports.getCategoriaRecurso = getCategoriaRecurso;
// ===================================================================================================
function getAllCategoriasRecurso(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const usuarios = yield conn.query('select * from categoriaRecurso order by creadoEn;');
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
exports.getAllCategoriasRecurso = getAllCategoriasRecurso;
function updateCategoriaRecurso(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = req.body;
            delete usuario.idCategoriaRecurso;
            // checking username
            const findUsername = yield conn.query('select nombre from categoriaRecurso where nombre = ?', [usuario.nombre]);
            if (findUsername[0].length) {
                return res.status(400).json({
                    message: 'La categoria de recurso insertada ya existe.',
                });
            }
            else {
                // adding usuario
                yield conn.query('UPDATE categoriaRecurso SET ? WHERE idCategoriaRecurso = ?', [usuario, usuario.idCategoriaRecurso]);
                return res.status(201).json({
                    message: 'Categoria de recurso modificada correctamente.',
                    body: usuario
                });
            }
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
exports.updateCategoriaRecurso = updateCategoriaRecurso;
function deleteCategriaRecurso(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from categoriaRecurso where id = ?', [id]);
        return res.json({
            message: 'Categoria de recurso eliminada exitosamente!'
        });
    });
}
exports.deleteCategriaRecurso = deleteCategriaRecurso;
