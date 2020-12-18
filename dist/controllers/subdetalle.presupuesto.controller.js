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
exports.deleteSubdetallePresupuestoDeObra = exports.updateSubdetallePresupuestoDeObra = exports.getAllSubdetallePresupuestosDeObra = exports.getSubdetallePresupuestoDeObra = exports.addSubdetallePresupuestoDeObra = void 0;
const uuid_1 = require("uuid");
const database_1 = require("../database");
// ===================================================================================================
function addSubdetallePresupuestoDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const subDetallePresupuesto = req.body;
            // generate uuid
            subDetallePresupuesto.idSubDetallePresupuesto = uuid_1.v4();
            yield conn.query('INSERT INTO subDetallePresupuesto SET ?', [subDetallePresupuesto]);
            return res.status(201).json({
                message: 'Subdetalle de presupuesto creado correctamente.',
                body: subDetallePresupuesto
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
exports.addSubdetallePresupuestoDeObra = addSubdetallePresupuestoDeObra;
// ===================================================================================================
function getSubdetallePresupuestoDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('select  * from subDetallePresupuesto where idDetallePresupuesto = ?', [uuid]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontro un subdetalle para el detalle ingresado.',
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
exports.getSubdetallePresupuestoDeObra = getSubdetallePresupuestoDeObra;
// ===================================================================================================
function getAllSubdetallePresupuestosDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const usuarios = yield conn.query('select * from subDetallePresupuesto order by creadoEn;');
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
exports.getAllSubdetallePresupuestosDeObra = getAllSubdetallePresupuestosDeObra;
function updateSubdetallePresupuestoDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const subDetallePresupuesto = req.body;
            // delete recurso.idRecurso porque estamos borrando estos id's?
            // adding usuario
            yield conn.query('UPDATE subDetallePresupuesto SET ? WHERE idSubDetallePresupuesto = ?', [subDetallePresupuesto, subDetallePresupuesto.idDetallePresupuesto]);
            return res.status(201).json({
                message: 'Subdetalle de presupuesto modificado correctamente.',
                body: subDetallePresupuesto
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
exports.updateSubdetallePresupuestoDeObra = updateSubdetallePresupuestoDeObra;
function deleteSubdetallePresupuestoDeObra(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from subDetallePresupuesto where idSubDetallePresupuesto = ?', [id]);
        return res.json({
            message: 'Subdetalle de presupuesto eliminado exitosamente'
        });
    });
}
exports.deleteSubdetallePresupuestoDeObra = deleteSubdetallePresupuestoDeObra;
