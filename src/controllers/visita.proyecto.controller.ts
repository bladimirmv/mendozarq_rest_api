import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../classes/database';

import { VisitaProyecto } from '../models/visita.proyecto.interface';
import { Credenciales } from './../models/credenciales.interface';

// ===================================================================================================
export async function addVisitaProyecto(req: Request, res: Response) {
	try {
		const conn = await connect();
		const visita: VisitaProyecto = req.body;

		// generate uuid
		visita.idVisita = uuid();

		await conn.query('INSERT INTO visitaProyecto SET ?', [visita]);
		return res.status(201).json({
			message: 'Recurso creado correctamente.',
			body: visita
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getVisitaProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('select  * from visitaProyecto where idProyecto = ?', [uuid]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontraron visitas registradas en este proyecto.',
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
export async function getAllVisitasProyecto(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuarios = await conn.query('select * from visitaProyecto order by creadoEn;');
		return res.json(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}

export async function updateVisitaProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const visita: VisitaProyecto = req.body;

		// delete recurso.idRecurso porque estamos borrando estos id's?

		// adding usuario
		await conn.query('UPDATE visitaProyecto SET ? WHERE idVisita = ?', [visita, visita.idVisita]);
		return res.status(201).json({
			message: 'Recurso modificado correctamente.',
			body: visita
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


export async function deleteVisitaProyecto(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from visitaProyecto where idVisita = ?', [id]);
	return res.json({
		message: 'Recurso eliminado exitosamente'
	});
}
