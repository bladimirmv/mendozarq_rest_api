import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../classes/database';

import { Recurso } from '../models/recurso.interface';
import { Credenciales } from './../models/credenciales.interface';

// ===================================================================================================
export async function addRecurso(req: Request, res: Response) {
	try {
		const conn = await connect();
		const recurso: Recurso = req.body;

		// generate uuid
		recurso.idRecurso = uuid();

		await conn.query('INSERT INTO recurso SET ?', [recurso]);
		return res.status(201).json({
			message: 'Recurso creado correctamente.',
			body: recurso
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getRecurso(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('select  * from recurso where idRecurso = ?', [uuid]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontraron recursos con el id ingresado.',
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
export async function getAllRecursos(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuarios = await conn.query('select * from recurso order by creadoEn;');
		return res.json(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}

export async function updateRecurso(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const recurso: Recurso = req.body;

		// delete recurso.idRecurso porque estamos borrando estos id's?

		// adding usuario
		await conn.query('UPDATE recurso SET ? WHERE idRecurso = ?', [recurso, recurso.idRecurso]);
		return res.status(201).json({
			message: 'Recurso modificado correctamente.',
			body: recurso
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


export async function deleteRecurso(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from recurso where idRecurso = ?', [id]);
	return res.json({
		message: 'Recurso eliminado exitosamente'
	});
}
