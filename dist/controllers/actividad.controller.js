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
exports.deleteActividad = exports.updateActividad = exports.getAllActividades = exports.getActividadesCronograma = exports.addActividad = void 0;
const uuid_1 = require("uuid");
const database_1 = require("./../database");
// ===================================================================================================
function addActividad(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const actividad = req.body;
            // generate uuid
            actividad.idActividad = uuid_1.v4();
            yield conn.query('INSERT INTO actividad SET ?', [actividad]);
            return res.status(201).json({
                message: 'Actividad creada correctamente.',
                body: actividad
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
exports.addActividad = addActividad;
// ===================================================================================================
function getActividadesCronograma(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('select  * from actividad where idCronograma = ?', [uuid]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontraron actividades en el cronograma ingresado.',
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
exports.getActividadesCronograma = getActividadesCronograma;
// ===================================================================================================
function getAllActividades(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const usuarios = yield conn.query('select * from actividad order by creadoEn;');
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
exports.getAllActividades = getAllActividades;
function updateActividad(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const actividad = req.body;
            delete actividad.idActividad;
            // adding usuario
            yield conn.query('UPDATE actividad SET ? WHERE idActividad = ?', [actividad, actividad.idActividad]);
            return res.status(201).json({
                message: 'Actividad de cronograma modificada correctamente.',
                body: actividad
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
exports.updateActividad = updateActividad;
function deleteActividad(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from actividad where idActividad = ?', [id]);
        return res.json({
            message: 'Actividad de cronograma eliminada exitosamente'
        });
    });
}
exports.deleteActividad = deleteActividad;
