import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from '../database';
import { categoriasAsignadasProyecto } from '../models/categorias.asignadas.proyecto.interface';
import { Credenciales } from '../models/credenciales.interface';

// ===================================================================================================
export async function addObservacionServicio(req: Request, res: Response) {
	try {
		const conn = await connect();
		const categoriasAsiganadasProyecto: categoriasAsignadasProyecto = req.body;
		
		// generate uuid
		categoriasAsiganadasProyecto.idCategsAsig = uuid();
        
        await conn.query('INSERT INTO observacionServicio SET ?', [categoriasAsiganadasProyecto]);
			return res.status(201).json({
				message: 'Observacion a servicio registrada correctamente.',
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
export async function getObservacionServicio(req: Request, res: Response) {
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
export async function updateObservacionServicio(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const categoriaAsignadaProyecto: categoriasAsignadasProyecto = req.body;

		delete categoriaAsignadaProyecto.idCategsAsig
		// checking username
		
		
			// adding usuario
			await conn.query('UPDATE observacionServicio SET ? WHERE idObsServicio = ?', [categoriaAsignadaProyecto, categoriaAsignadaProyecto.idCategsAsig]);
			return res.status(201).json({
				message: 'Observacion de servicio modificada correctamente.',
				body: categoriaAsignadaProyecto
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


export async function deleteObservacionServicio(req: Request, res: Response) {
	try {
		const id = req.params.id;
		const conn = await connect();

		await conn.query('DELETE from observacionServicio where idObsServicio = ?', [id]);
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
