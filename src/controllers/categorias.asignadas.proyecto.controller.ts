import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../classes/database';

import { categoriasAsignadasProyecto } from '../models/categorias.asignadas.proyecto.interface';
import { Credenciales } from '../models/credenciales.interface';

// ===================================================================================================
export async function addCategriasAsignadasProyecto(req: Request, res: Response) {
	try {
		const conn = await connect();
		const categoriasAsiganadasProyecto: categoriasAsignadasProyecto = req.body;

		// generate uuid
		categoriasAsiganadasProyecto.idCategsAsig = uuid();

		await conn.query('INSERT INTO categoriasAsignadasProyecto SET ?', [categoriasAsiganadasProyecto]);
		return res.status(201).json({
			message: 'Categoria asignada al proyecto correctamente.',
			body: categoriasAsiganadasProyecto
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getCategriasAsignadasProyecto(req: Request, res: Response) {
	try {
		const idEntrante = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('SELECT c.nombre FROM categoriaasignadaproyecto as catA INNER JOIN categoriaproyecto as c ON c.idCategoriaProyecto = catA.idCategoria WHERE catA.idCategoria = c.idCategoriaProyecto AND catA.idProyecto = ?;', [idEntrante]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontraron las categorias asignadas al proyecto.',
				error: '404'
			});
		}

	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error',
			error
		});
	}
}
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
export async function updateCategriasAsignadasProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const usuario: categoriasAsignadasProyecto = req.body;

		delete usuario.idCategsAsig
		// checking username


		// adding usuario
		await conn.query('UPDATE categoriasAsignadasProyecto SET ? WHERE idCategoriaProyecto = ?', [usuario, usuario.idCategsAsig]);
		return res.status(201).json({
			message: 'Categoria de proyecto modificada correctamente.',
			body: usuario
		});


		// await conn.query('update usuario set ? where id = ?', [usuario, uuid]);
		// return res.json({
		// 	message: 'post updated'
		// });
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error',
			error
		});
	}

}


export async function deleteCategriasAsignadasProyecto(req: Request, res: Response) {
	try {
		const id = req.params.id;
		const conn = await connect();

		await conn.query('DELETE from categoriasAsignadasProyecto where id = ?', [id]);
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

}
