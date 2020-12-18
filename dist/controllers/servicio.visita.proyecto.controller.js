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
exports.deleteServicioVisitaProyecto = exports.updateServicioVisitaProyecto = exports.getServicioVisitaProyecto = exports.addServicioVisitaProyecto = void 0;
const uuid_1 = require("uuid");
const database_1 = require("../database");
// ===================================================================================================
function addServicioVisitaProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const servicioVisitaProyecto = req.body;
            // generate uuid
            servicioVisitaProyecto.idServicioVisitaProyecto = uuid_1.v4();
            yield conn.query('INSERT INTO servicioVisitaProyecto SET ?', [servicioVisitaProyecto]);
            return res.status(201).json({
                message: 'Servicio en visita registrada correctamente.',
                body: servicioVisitaProyecto
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
exports.addServicioVisitaProyecto = addServicioVisitaProyecto;
// ===================================================================================================
//falta cambiar la query
function getServicioVisitaProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const idEntrante = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('SELECT obss.creadoEn, obss.estado, obss.descripcion, vst.nombre AS "visita", svc.nombre AS "servicio" FROM observacionservicio as obss INNER JOIN servicioproyecto AS svc ON obss.idServicio = svc.idServicio INNER JOIN visitaproyecto AS vst ON vst.idVisita = obss.idVisita WHERE obss.idVisita = ?;', [idEntrante]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontraron servicios en esta visita.',
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
exports.getServicioVisitaProyecto = getServicioVisitaProyecto;
//sera que esto aplica? xq en si directo borrariamos, creo q no aplica para esta table
function updateServicioVisitaProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const servicioVisitaProyecto = req.body;
            delete servicioVisitaProyecto.idServicioVisitaProyecto;
            // checking username
            // adding usuario
            yield conn.query('UPDATE servicioVisitaProyecto SET ? WHERE idServicioVisitaProyecto = ?', [servicioVisitaProyecto, servicioVisitaProyecto.idServicioVisitaProyecto]);
            return res.status(201).json({
                message: 'Servicio en visita modificado correctamente.',
                body: servicioVisitaProyecto
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
exports.updateServicioVisitaProyecto = updateServicioVisitaProyecto;
function deleteServicioVisitaProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const id = req.params.id;
            const conn = yield database_1.connect();
            yield conn.query('DELETE from servicioVisitaProyecto where idServicioVisitaProyecto = ?', [id]);
            return res.json({
                message: 'Servicio en vista eliminado!'
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
exports.deleteServicioVisitaProyecto = deleteServicioVisitaProyecto;
