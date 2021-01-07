import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../classes/database';

import { Cronograma } from '../models/cronograma.interface';
import { Credenciales } from './../models/credenciales.interface';

// ===================================================================================================
export async function addCronograma(req: Request, res: Response) {
	try {
		const conn = await connect();
		const cronograma: Cronograma = req.body;

		// generate uuid
		cronograma.idCronograma = uuid();

		await conn.query('INSERT INTO cronograma SET ?', [cronograma]);
		return res.status(201).json({
			message: 'Cronograma creado correctamente.',
			body: cronograma
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getCronograma(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('select  * from cronograma where idProyecto = ?', [uuid]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontraron cronogramas en el proyecto ingresado.',
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
export async function getAllCronogramas(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuarios = await conn.query('select * from cronograma order by creadoEn;');
		return res.json(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}

export async function updateCronograma(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const cronograma: Cronograma = req.body;

		delete cronograma.idCronograma

		// adding usuario
		await conn.query('UPDATE cronograma SET ? WHERE idCronograma = ?', [cronograma, cronograma.idCronograma]);
		return res.status(201).json({
			message: 'Cronograma de proyecto modificado correctamente.',
			body: cronograma
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


export async function deleteCronograma(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from cronograma where idCronograma = ?', [id]);
	return res.json({
		message: 'Cronograma de proyecto eliminado exitosamente'
	});
}
