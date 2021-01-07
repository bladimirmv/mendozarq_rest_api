import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../classes/database';

import { CategoriaRecurso } from '../models/categoria.recurso.interface';
import { Credenciales } from './../models/credenciales.interface';

// ===================================================================================================
export async function addCategoriaRecurso(req: Request, res: Response) {
	try {
		const conn = await connect();
		const categoriaRecurso: CategoriaRecurso = req.body;

		// generate uuid
		categoriaRecurso.idCategoriaRecurso = uuid();

		await conn.query('INSERT INTO categoriaRecurso SET ?', [categoriaRecurso]);
		return res.status(201).json({
			message: 'Categoria de recursos creado correctamente.',
			body: categoriaRecurso
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getCategoriaRecurso(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('select  * from categoriaRecurso where idCategoriaRecurso = ?', [uuid]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontro la categoria de recurso.',
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
export async function getAllCategoriasRecurso(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuarios = await conn.query('select * from categoriaRecurso order by creadoEn;');
		return res.json(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}

export async function updateCategoriaRecurso(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const usuario: CategoriaRecurso = req.body;

		delete usuario.idCategoriaRecurso
		// checking username
		const findUsername = await conn.query('select nombre from categoriaRecurso where nombre = ?', [usuario.nombre]);
		if (findUsername[0].length) {
			return res.status(400).json({
				message: 'La categoria de recurso insertada ya existe.',
			});
		} else {
			// adding usuario
			await conn.query('UPDATE categoriaRecurso SET ? WHERE idCategoriaRecurso = ?', [usuario, usuario.idCategoriaRecurso]);
			return res.status(201).json({
				message: 'Categoria de recurso modificada correctamente.',
				body: usuario
			});
		}

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


export async function deleteCategriaRecurso(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from categoriaRecurso where id = ?', [id]);
	return res.json({
		message: 'Categoria de recurso eliminada exitosamente!'
	});
}
