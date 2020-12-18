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
exports.deletePresupuestoDeObra = exports.updatePresupuestoDeObra = exports.getAllPresupuestosDeObra = exports.getPresupuestoDeObra = exports.addPresupuestoDeObra = void 0;
const uuid_1 = require("uuid");
const database_1 = require("./../database");
// ===================================================================================================
function addPresupuestoDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const presupuesto = req.body;
            // generate uuid
            presupuesto.idPresupuesto = uuid_1.v4();
            yield conn.query('INSERT INTO presupuestoDeObra SET ?', [presupuesto]);
            return res.status(201).json({
                message: 'Presupuesto de obra creado correctamente.',
                body: presupuesto
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
exports.addPresupuestoDeObra = addPresupuestoDeObra;
// ===================================================================================================
function getPresupuestoDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('select  * from presupuestoDeObra where idProyecto = ?', [uuid]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontro un presupuesto para la obra ingresada.',
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
exports.getPresupuestoDeObra = getPresupuestoDeObra;
// ===================================================================================================
function getAllPresupuestosDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const usuarios = yield conn.query('select * from presupuestoDeObra order by creadoEn;');
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
exports.getAllPresupuestosDeObra = getAllPresupuestosDeObra;
function updatePresupuestoDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const presupuesto = req.body;
            // delete recurso.idRecurso porque estamos borrando estos id's?
            // adding usuario
            yield conn.query('UPDATE presupuestoDeObra SET ? WHERE idPresupuesto = ?', [presupuesto, presupuesto.idPresupuesto]);
            return res.status(201).json({
                message: 'Presupuesto de obra modificado correctamente.',
                body: presupuesto
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
exports.updatePresupuestoDeObra = updatePresupuestoDeObra;
function deletePresupuestoDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from presupuestoDeObra where idPresupuesto = ?', [id]);
        return res.json({
            message: 'Presupuesto de obra eliminado exitosamente'
        });
    });
}
exports.deletePresupuestoDeObra = deletePresupuestoDeObra;
