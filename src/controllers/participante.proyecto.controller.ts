import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from '../database';
import { ParticipanteProyecto } from '../models/participante.proyecto.interface';
import { Credenciales } from '../models/credenciales.interface';

// ===================================================================================================
export async function addParticipanteProyecto(req: Request, res: Response) {
	try {
		const conn = await connect();
		const participanteProyecto: ParticipanteProyecto = req.body;

		// generate uuid
		participanteProyecto.idParticipante = uuid();

		await conn.query('INSERT INTO participanteProyecto SET ?', [participanteProyecto]);
		return res.status(201).json({
			message: 'Observacion a servicio registrada correctamente.',
			body: participanteProyecto
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
//ESTA PARTE ESTA PENDIENTE
export async function getParticipanteProyecto(req: Request, res: Response) {
	try {
		const idEntrante = req.params.id;
		const conn = await connect();
		const usuario = await conn.query('SELECT obss.creadoEn, obss.estado, obss.descripcion, vst.nombre AS "visita", svc.nombre AS "servicio" FROM observacionservicio as obss INNER JOIN servicioproyecto AS svc ON obss.idServicio = svc.idServicio INNER JOIN visitaproyecto AS vst ON vst.idVisita = obss.idVisita WHERE obss.idVisita = ?;', [idEntrante]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontraron observaciones a servicios en esta visita.',
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
export async function updateParticipanteProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const participanteProyecto: ParticipanteProyecto = req.body;

		delete participanteProyecto.idParticipante
		// checking username


		// adding usuario
		await conn.query('UPDATE participanteProyecto SET ? WHERE idParticipante = ?', [participanteProyecto, participanteProyecto.idParticipante]);
		return res.status(201).json({
			message: 'Observacion de servicio modificada correctamente.',
			body: participanteProyecto
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


export async function deleteParticipanteProyecto(req: Request, res: Response) {
	try {
		const id = req.params.id;
		const conn = await connect();

		await conn.query('DELETE from participanteProyecto where idParticipante = ?', [id]);
		return res.json({
			message: 'Observacion de servicio eliminada!'
		});
	}
	catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error',
			error
		});
	}

}
