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
exports.deleteCategriaProyecto = exports.updateCategoriaProyecto = exports.getAllCategoriasProyecto = exports.getCategoriaProyecto = exports.addCategoriaProyecto = void 0;
const uuid_1 = require("uuid");
const database_1 = require("./../database");
// ===================================================================================================
function addCategoriaProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const categoriaProyecto = req.body;
            // generate uuid
            categoriaProyecto.idCategoriaProyecto = uuid_1.v4();
            yield conn.query('INSERT INTO categoriaProyecto SET ?', [categoriaProyecto]);
            return res.status(201).json({
                message: 'Categoria de proyectos creado correctamente.',
                body: categoriaProyecto
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
exports.addCategoriaProyecto = addCategoriaProyecto;
// ===================================================================================================
function getCategoriaProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('select  * from categoriaProyecto where idCategoriaProyecto = ?', [uuid]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontro la categoria de proyecto.',
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
exports.getCategoriaProyecto = getCategoriaProyecto;
// ===================================================================================================
function getAllCategoriasProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const usuarios = yield conn.query('select * from categoriaProyecto order by creadoEn;');
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
exports.getAllCategoriasProyecto = getAllCategoriasProyecto;
function updateCategoriaProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = req.body;
            delete usuario.idCategoriaProyecto;
            // checking username
            const findUsername = yield conn.query('select nombre from categoriaProyecto where nombre = ?', [usuario.nombre]);
            if (findUsername[0].length) {
                return res.status(400).json({
                    message: 'La categoria insertada ya existe.',
                });
            }
            else {
                // adding usuario
                yield conn.query('UPDATE categoriaproyecto SET ? WHERE idCategoriaProyecto = ?', [usuario, usuario.idCategoriaProyecto]);
                return res.status(201).json({
                    message: 'Categoria de proyecto modificada correctamente.',
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
exports.updateCategoriaProyecto = updateCategoriaProyecto;
function deleteCategriaProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from categoriaProyecto where id = ?', [id]);
        return res.json({
            message: 'Categoria de proyecto eliminada!'
        });
    });
}
exports.deleteCategriaProyecto = deleteCategriaProyecto;
