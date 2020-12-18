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
exports.deleteParticipanteProyecto = exports.updateParticipanteProyecto = exports.getParticipanteProyecto = exports.addParticipanteProyecto = void 0;
const uuid_1 = require("uuid");
const database_1 = require("../database");
// ===================================================================================================
function addParticipanteProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const participanteProyecto = req.body;
            // generate uuid
            participanteProyecto.idParticipante = uuid_1.v4();
            yield conn.query('INSERT INTO participanteProyecto SET ?', [participanteProyecto]);
            return res.status(201).json({
                message: 'Observacion a servicio registrada correctamente.',
                body: participanteProyecto
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
exports.addParticipanteProyecto = addParticipanteProyecto;
// ===================================================================================================
//ESTA PARTE ESTA PENDIENTE
function getParticipanteProyecto(req, res) {
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
exports.getParticipanteProyecto = getParticipanteProyecto;
//sera que esto aplica? xq en si directo borrariamos, creo q no aplica para esta table
function updateParticipanteProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const participanteProyecto = req.body;
            delete participanteProyecto.idParticipante;
            // checking username
            // adding usuario
            yield conn.query('UPDATE participanteProyecto SET ? WHERE idParticipante = ?', [participanteProyecto, participanteProyecto.idParticipante]);
            return res.status(201).json({
                message: 'Observacion de servicio modificada correctamente.',
                body: participanteProyecto
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
exports.updateParticipanteProyecto = updateParticipanteProyecto;
function deleteParticipanteProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const id = req.params.id;
            const conn = yield database_1.connect();
            yield conn.query('DELETE from participanteProyecto where idParticipante = ?', [id]);
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
exports.deleteParticipanteProyecto = deleteParticipanteProyecto;
