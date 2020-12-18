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
exports.deleteParticipanteVisitaProyecto = exports.updateParticipanteVisitaProyecto = exports.getParticipanteVisitaProyecto = exports.addParticipanteVisitaProyecto = void 0;
const uuid_1 = require("uuid");
const database_1 = require("../database");
// ===================================================================================================
function addParticipanteVisitaProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const participanteVisitaProyecto = req.body;
            // generate uuid
            participanteVisitaProyecto.idParticipanteVisitaProyecto = uuid_1.v4();
            yield conn.query('INSERT INTO participanteVisitaProyecto SET ?', [participanteVisitaProyecto]);
            return res.status(201).json({
                message: 'Observacion a servicio registrada correctamente.',
                body: participanteVisitaProyecto
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
exports.addParticipanteVisitaProyecto = addParticipanteVisitaProyecto;
// ===================================================================================================
//falta cambiar la query
function getParticipanteVisitaProyecto(req, res) {
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
                    message: 'No se encontraron observaciones a servicios en esta visita.',
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
exports.getParticipanteVisitaProyecto = getParticipanteVisitaProyecto;
//sera que esto aplica? xq en si directo borrariamos, creo q no aplica para esta table
function updateParticipanteVisitaProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const participanteVisitaProyecto = req.body;
            delete participanteVisitaProyecto.idParticipanteVisitaProyecto;
            // checking username
            // adding usuario
            yield conn.query('UPDATE participanteVisitaProyecto SET ? WHERE idParticipanteVisitaProyecto = ?', [participanteVisitaProyecto, participanteVisitaProyecto.idParticipanteVisitaProyecto]);
            return res.status(201).json({
                message: 'Observacion de servicio modificada correctamente.',
                body: participanteVisitaProyecto
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
exports.updateParticipanteVisitaProyecto = updateParticipanteVisitaProyecto;
function deleteParticipanteVisitaProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const id = req.params.id;
            const conn = yield database_1.connect();
            yield conn.query('DELETE from participanteVisitaProyecto where idParticipanteVisitaProyecto = ?', [id]);
            return res.json({
                message: 'Observacion de servicio eliminada!'
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
exports.deleteParticipanteVisitaProyecto = deleteParticipanteVisitaProyecto;
