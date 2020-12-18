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
exports.deleteCronograma = exports.updateCronograma = exports.getAllCronogramas = exports.getCronograma = exports.addCronograma = void 0;
const uuid_1 = require("uuid");
const database_1 = require("./../database");
// ===================================================================================================
function addCronograma(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const cronograma = req.body;
            // generate uuid
            cronograma.idCronograma = uuid_1.v4();
            yield conn.query('INSERT INTO cronograma SET ?', [cronograma]);
            return res.status(201).json({
                message: 'Cronograma creado correctamente.',
                body: cronograma
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
exports.addCronograma = addCronograma;
// ===================================================================================================
function getCronograma(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('select  * from cronograma where idProyecto = ?', [uuid]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontraron cronogramas en el proyecto ingresado.',
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
exports.getCronograma = getCronograma;
// ===================================================================================================
function getAllCronogramas(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const usuarios = yield conn.query('select * from cronograma order by creadoEn;');
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
exports.getAllCronogramas = getAllCronogramas;
function updateCronograma(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const cronograma = req.body;
            delete cronograma.idCronograma;
            // adding usuario
            yield conn.query('UPDATE cronograma SET ? WHERE idCronograma = ?', [cronograma, cronograma.idCronograma]);
            return res.status(201).json({
                message: 'Cronograma de proyecto modificado correctamente.',
                body: cronograma
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
exports.updateCronograma = updateCronograma;
function deleteCronograma(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from cronograma where idCronograma = ?', [id]);
        return res.json({
            message: 'Cronograma de proyecto eliminado exitosamente'
        });
    });
}
exports.deleteCronograma = deleteCronograma;
