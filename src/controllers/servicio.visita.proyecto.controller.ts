import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../classes/database';

import { ServicioVisitaProyecto } from '../models/servicios.visita.proyecto.interface';
import { Credenciales } from '../models/credenciales.interface';

// ===================================================================================================
export async function addServicioVisitaProyecto(req: Request, res: Response) {
	try {
		const conn = await connect();
		const servicioVisitaProyecto: ServicioVisitaProyecto = req.body;

		// generate uuid
		servicioVisitaProyecto.idServicioVisitaProyecto = uuid();

		await conn.query('INSERT INTO servicioVisitaProyecto SET ?', [servicioVisitaProyecto]);
		return res.status(201).json({
			message: 'Servicio en visita registrada correctamente.',
			body: servicioVisitaProyecto
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
//falta cambiar la query
export async function getServicioVisitaProyecto(req: Request, res: Response) {
	try {
		const idEntrante = req.params.id;
		const conn = await connect();
		const usuario = await conn.query('SELECT obss.creadoEn, obss.estado, obss.descripcion, vst.nombre AS "visita", svc.nombre AS "servicio" FROM observacionservicio as obss INNER JOIN servicioproyecto AS svc ON obss.idServicio = svc.idServicio INNER JOIN visitaproyecto AS vst ON vst.idVisita = obss.idVisita WHERE obss.idVisita = ?;', [idEntrante]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontraron servicios en esta visita.',
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


//sera que esto aplica? xq en si directo borrariamos, creo q no aplica para esta table
export async function updateServicioVisitaProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const servicioVisitaProyecto: ServicioVisitaProyecto = req.body;

		delete servicioVisitaProyecto.idServicioVisitaProyecto
		// checking username


		// adding usuario
		await conn.query('UPDATE servicioVisitaProyecto SET ? WHERE idServicioVisitaProyecto = ?', [servicioVisitaProyecto, servicioVisitaProyecto.idServicioVisitaProyecto]);
		return res.status(201).json({
			message: 'Servicio en visita modificado correctamente.',
			body: servicioVisitaProyecto
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


export async function deleteServicioVisitaProyecto(req: Request, res: Response) {
	try {
		const id = req.params.id;
		const conn = await connect();

		await conn.query('DELETE from servicioVisitaProyecto where idServicioVisitaProyecto = ?', [id]);
		return res.json({
			message: 'Servicio en vista eliminado!'
		});
	}
	catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error',
			error
		});
	}

}








