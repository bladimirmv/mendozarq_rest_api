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
exports.deleteDetallePresupuestoDeObra = exports.updateDetallePresupuestoDeObra = exports.getAllDetallePresupuestosDeObra = exports.getDetallePresupuestoDeObra = exports.addDetallePresupuestoDeObra = void 0;
const uuid_1 = require("uuid");
const database_1 = require("./../database");
// ===================================================================================================
function addDetallePresupuestoDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const detallePresupuesto = req.body;
            // generate uuid
            detallePresupuesto.idPresupuesto = uuid_1.v4();
            yield conn.query('INSERT INTO detallePresupuesto SET ?', [detallePresupuesto]);
            return res.status(201).json({
                message: 'Detalle de presupuesto de obra creado correctamente.',
                body: detallePresupuesto
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
exports.addDetallePresupuestoDeObra = addDetallePresupuestoDeObra;
// ===================================================================================================
function getDetallePresupuestoDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('select  * from detallePresupuesto where idPresupuesto = ?', [uuid]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontro un detalle de presupuesto para la obra ingresada.',
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
exports.getDetallePresupuestoDeObra = getDetallePresupuestoDeObra;
// ===================================================================================================
function getAllDetallePresupuestosDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const usuarios = yield conn.query('select * from detallePresupuesto order by creadoEn;');
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
exports.getAllDetallePresupuestosDeObra = getAllDetallePresupuestosDeObra;
function updateDetallePresupuestoDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const detallePresupuesto = req.body;
            // delete recurso.idRecurso porque estamos borrando estos id's?
            // adding usuario
            yield conn.query('UPDATE detallePresupuesto SET ? WHERE idDetallePresupuesto = ?', [detallePresupuesto, detallePresupuesto.idPresupuesto]);
            return res.status(201).json({
                message: 'Detalle de presupuesto de obra modificado correctamente.',
                body: detallePresupuesto
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
exports.updateDetallePresupuestoDeObra = updateDetallePresupuestoDeObra;
function deleteDetallePresupuestoDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from detallePresupuesto where idDetallePresupuesto = ?', [id]);
        return res.json({
            message: 'Detalle de presupuesto de obra eliminado exitosamente'
        });
    });
}
exports.deleteDetallePresupuestoDeObra = deleteDetallePresupuestoDeObra;
