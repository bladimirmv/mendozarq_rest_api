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
exports.deleteCategriasAsignadasProyecto = exports.updateCategriasAsignadasProyecto = exports.getCategriasAsignadasProyecto = exports.addCategriasAsignadasProyecto = void 0;
const uuid_1 = require("uuid");
const database_1 = require("../database");
// ===================================================================================================
function addCategriasAsignadasProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const categoriasAsiganadasProyecto = req.body;
            // generate uuid
            categoriasAsiganadasProyecto.idCategsAsig = uuid_1.v4();
            yield conn.query('INSERT INTO categoriasAsignadasProyecto SET ?', [categoriasAsiganadasProyecto]);
            return res.status(201).json({
                message: 'Categoria asignada al proyecto correctamente.',
                body: categoriasAsiganadasProyecto
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
exports.addCategriasAsignadasProyecto = addCategriasAsignadasProyecto;
// ===================================================================================================
function getCategriasAsignadasProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const idEntrante = req.params.id;
            const conn = yield database_1.connect();
            const usuario = yield conn.query('SELECT c.nombre FROM categoriaasignadaproyecto as catA INNER JOIN categoriaproyecto as c ON c.idCategoriaProyecto = catA.idCategoria WHERE catA.idCategoria = c.idCategoriaProyecto AND catA.idProyecto = ?;', [idEntrante]);
            if (usuario[0].length) {
                res.send(usuario[0]);
            }
            else {
                return res.status(404).json({
                    message: 'No se encontraron las categorias asignadas al proyecto.',
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
exports.getCategriasAsignadasProyecto = getCategriasAsignadasProyecto;
// ===================================================================================================
//------------- NO ME PARECE QUE USEMOS EL GETALL PARA ESTA TABLA ---------------------------------
// export async function getAllCategriasAsignadasProyecto(req: Request, res: Response) {
// 	try {
// 		const conn = await connect();
// 		const usuarios = await conn.query('select * from categoriasAsignadasProyecto order by creadoEn;');
// 		return res.json(usuarios[0]);
// 	} catch (error) {
// 		return res.status(400).json({
// 			message: 'Ocurrio un error.',
// 			error
// 		});
// 	}
// }
//sera que esto aplica? xq en si directo borrariamos, creo q no aplica para esta table
function updateCategriasAsignadasProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const uuid = req.params.id;
            const conn = yield database_1.connect();
            const usuario = req.body;
            delete usuario.idCategsAsig;
            // checking username
            // adding usuario
            yield conn.query('UPDATE categoriasAsignadasProyecto SET ? WHERE idCategoriaProyecto = ?', [usuario, usuario.idCategsAsig]);
            return res.status(201).json({
                message: 'Categoria de proyecto modificada correctamente.',
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
exports.updateCategriasAsignadasProyecto = updateCategriasAsignadasProyecto;
function deleteCategriasAsignadasProyecto(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const id = req.params.id;
            const conn = yield database_1.connect();
            yield conn.query('DELETE from categoriasAsignadasProyecto where id = ?', [id]);
            return res.json({
                message: 'Categoria asignada al proyecto eliminada!'
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
exports.deleteCategriasAsignadasProyecto = deleteCategriasAsignadasProyecto;
