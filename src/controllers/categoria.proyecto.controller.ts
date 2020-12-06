import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../database';
import { CategoriaProyecto } from '../models/categoria.proyecto.interface';
import { Credenciales } from './../models/credenciales.interface';

// ===================================================================================================
export async function addCategoriaProyecto(req: Request, res: Response) {
	try {
		const conn = await connect();
		const categoriaProyecto: CategoriaProyecto = req.body;
		
		// generate uuid
		categoriaProyecto.idCategoriaProyecto = uuid();
        
        await conn.query('INSERT INTO categoriaProyecto SET ?', [categoriaProyecto]);
			return res.status(201).json({
				message: 'Usuario creado correctamente.',
				body: categoriaProyecto
            });
            
            
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getCategoriaProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('select  * from categoriaProyecto where idCategoriaProyecto = ?', [uuid]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontro la categoria de proyecto.',
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
export async function getAllCategoriasProyecto(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuarios = await conn.query('select * from categoriaProyecto order by creadoEn;');
		return res.json(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}

export async function updateCategoriaProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const usuario: CategoriaProyecto = req.body;

		delete usuario.idCategoriaProyecto
		// checking username
		const findUsername = await conn.query('select nombre from categoriaProyecto where nombre = ?', [usuario.nombre]);
		if (findUsername[0].length) {
			return res.status(400).json({
				message: 'La categoria insertada ya existe.',
			});
		} else {
			// adding usuario
			await conn.query('UPDATE categoriaproyecto SET nombre = ? WHERE idCategoriaProyecto = ?', [usuario.nombre, usuario.idCategoriaProyecto]);
			return res.status(201).json({
				message: 'Categoria de proyecto modificada correctamente.',
				body: usuario
			});
		}

		// await conn.query('update usuario set ? where id = ?', [usuario, uuid]);
		// return res.json({
		// 	message: 'post updated'
		// });
	} catch (error) {

	}

}


export async function deleteCategriaProyecto(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from categoriaProyecto where id = ?', [id]);
	return res.json({
		message: 'Categoria de proyecto eliminada!'
	});
}
