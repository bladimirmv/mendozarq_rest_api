import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../database';
import { ServicioProyecto } from '../models/servicio.proyecto.interface';
import { Credenciales } from './../models/credenciales.interface';

// ===================================================================================================
export async function addServicioProyecto(req: Request, res: Response) {
	try {
		const conn = await connect();
		const servicio: ServicioProyecto = req.body;

		// generate uuid
		servicio.idServicio = uuid();

		await conn.query('INSERT INTO servicioProyecto SET ?', [servicio]);
		return res.status(201).json({
			message: 'Servicio creado correctamente.',
			body: servicio
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getServicioProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('select  * from servicioProyecto where idProyecto = ?', [uuid]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontraron servicios asignados al proyecto actual.',
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
export async function getAllServiciosProyecto(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuarios = await conn.query('select * from servicioProyecto order by creadoEn;');
		return res.json(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}

export async function updateServicioProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const servicio: ServicioProyecto = req.body;

		// delete recurso.idRecurso porque estamos borrando estos id's?
	    
			// adding usuario
			await conn.query('UPDATE servicioProyecto SET ? WHERE idServicio = ?', [servicio, servicio.idServicio]);
			return res.status(201).json({
				message: 'Servicio modificado correctamente.',
				body: servicio
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


export async function deleteServicioProyecto(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from servicioProyecto where idServicio = ?', [id]);
	return res.json({
		message: 'Servicio eliminado exitosamente'
	});
}
