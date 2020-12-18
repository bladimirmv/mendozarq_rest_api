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
exports.deleteRecursosActividad = exports.updateRecursosActividad = exports.getRecursosActividad = exports.addRecursosActividad = void 0;
const uuid_1 = require("uuid");
const database_1 = require("../database");
// ===================================================================================================
function addRecursosActividad(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const recursosActividad = req.body;
            // generate uuid
            recursosActividad.idRecursosActividad = uuid_1.v4();
            yield conn.query('INSERT INTO recursosActividad SET ?', [recursosActividad]);
            return res.status(201).json({
                message: 'Recurso asignado a la actividad correctamente.',
                body: recursosActividad
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
exports.addRecursosActividad = addRecursosActividad;
// ===================================================================================================
//esto aun no funciona, debo cambiar la query! esta recuperando de otro lado
function getRecursosActividad(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const idEntrante = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('SELECT c.nombre FROM recursosActividad as catA INNER JOIN categoriaproyecto as c ON c.idCategoriaProyecto = catA.idCategoria WHERE catA.idCategoria = c.idCategoriaProyecto AND catA.idProyecto = ?;', [idEntrante]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontraron recursos asignados a la actividad.',
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
exports.getRecursosActividad = getRecursosActividad;
// ===================================================================================================
function updateRecursosActividad(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = req.body;
            delete usuario.idRecursosActividad;
            // checking username
            // adding usuario
            yield conn.query('UPDATE recursosActividad SET ? WHERE idRecursosActividad = ?', [usuario, usuario.idRecursosActividad]);
            return res.status(201).json({
                message: 'Recurso de actividad modificado correctamente.',
                body: usuario
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
exports.updateRecursosActividad = updateRecursosActividad;
function deleteRecursosActividad(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const id = req.params.id;
            const conn = yield database_1.connect();
            yield conn.query('DELETE from recursosActividad where id = ?', [id]);
            return res.json({
                message: 'Recurso asignado a la actividad eliminado exitosamente!'
            });
        }
        catch (error) {
            return res.status(400).json({
                message: 'Ocurrio un error',
                error
            });
        }
    });
}
exports.deleteRecursosActividad = deleteRecursosActividad;
