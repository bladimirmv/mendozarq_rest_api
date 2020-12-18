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
exports.deleteServicioProyecto = exports.updateServicioProyecto = exports.getAllServiciosProyecto = exports.getServicioProyecto = exports.addServicioProyecto = void 0;
const uuid_1 = require("uuid");
const database_1 = require("./../database");
// ===================================================================================================
function addServicioProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const servicio = req.body;
            // generate uuid
            servicio.idServicio = uuid_1.v4();
            yield conn.query('INSERT INTO servicioProyecto SET ?', [servicio]);
            return res.status(201).json({
                message: 'Servicio creado correctamente.',
                body: servicio
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
exports.addServicioProyecto = addServicioProyecto;
// ===================================================================================================
function getServicioProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('select  * from servicioProyecto where idProyecto = ?', [uuid]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontraron servicios asignados al proyecto actual.',
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
exports.getServicioProyecto = getServicioProyecto;
// ===================================================================================================
function getAllServiciosProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const usuarios = yield conn.query('select * from servicioProyecto order by creadoEn;');
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
exports.getAllServiciosProyecto = getAllServiciosProyecto;
function updateServicioProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const servicio = req.body;
            // delete recurso.idRecurso porque estamos borrando estos id's?
            // adding usuario
            yield conn.query('UPDATE servicioProyecto SET ? WHERE idServicio = ?', [servicio, servicio.idServicio]);
            return res.status(201).json({
                message: 'Servicio modificado correctamente.',
                body: servicio
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
exports.updateServicioProyecto = updateServicioProyecto;
function deleteServicioProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from servicioProyecto where idServicio = ?', [id]);
        return res.json({
            message: 'Servicio eliminado exitosamente'
        });
    });
}
exports.deleteServicioProyecto = deleteServicioProyecto;
