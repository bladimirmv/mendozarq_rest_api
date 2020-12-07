import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../database';
import { Actividad } from '../models/actividad.interface';
import { Credenciales } from './../models/credenciales.interface';

// ===================================================================================================
export async function addActividad(req: Request, res: Response) {
	try {
		const conn = await connect();
		const actividad: Actividad = req.body;

		// generate uuid
		actividad.idActividad = uuid();

		await conn.query('INSERT INTO actividad SET ?', [actividad]);
		return res.status(201).json({
			message: 'Actividad creada correctamente.',
			body: actividad
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getActividadesCronograma(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('select  * from actividad where idCronograma = ?', [uuid]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontraron actividades en el cronograma ingresado.',
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
export async function getAllActividades(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuarios = await conn.query('select * from actividad order by creadoEn;');
		return res.json(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}

export async function updateActividad(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const actividad: Actividad = req.body;

		delete actividad.idActividad
	    
			// adding usuario
			await conn.query('UPDATE actividad SET ? WHERE idActividad = ?', [actividad, actividad.idActividad]);
			return res.status(201).json({
				message: 'Actividad de cronograma modificada correctamente.',
				body: actividad
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


export async function deleteActividad(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from actividad where idActividad = ?', [id]);
	return res.json({
		message: 'Actividad de cronograma eliminada exitosamente'
	});
}
