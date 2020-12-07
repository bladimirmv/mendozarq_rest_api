import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from '../database';
import { recursosActividad } from '../models/recursos.actividad.interface';
import { Credenciales } from '../models/credenciales.interface';

// ===================================================================================================
export async function addRecursosActividad(req: Request, res: Response) {
	try {
		const conn = await connect();
		const recursosActividad: recursosActividad = req.body;
		
		// generate uuid
		recursosActividad.idRecursosActividad = uuid();
        
        await conn.query('INSERT INTO recursosActividad SET ?', [recursosActividad]);
			return res.status(201).json({
				message: 'Recurso asignado a la actividad correctamente.',
				body: recursosActividad
            });
            
            
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
//esto aun no funciona, debo cambiar la query! esta recuperando de otro lado
export async function getRecursosActividad(req: Request, res: Response) {
	try {
		const idEntrante = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('SELECT c.nombre FROM recursosActividad as catA INNER JOIN categoriaproyecto as c ON c.idCategoriaProyecto = catA.idCategoria WHERE catA.idCategoria = c.idCategoriaProyecto AND catA.idProyecto = ?;', [idEntrante]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontraron recursos asignados a la actividad.',
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


export async function updateRecursosActividad(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const usuario: recursosActividad = req.body;

		delete usuario.idRecursosActividad
		// checking username
		
		
			// adding usuario
			await conn.query('UPDATE recursosActividad SET ? WHERE idRecursosActividad = ?', [usuario, usuario.idRecursosActividad]);
			return res.status(201).json({
				message: 'Recurso de actividad modificado correctamente.',
				body: usuario
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


export async function deleteRecursosActividad(req: Request, res: Response) {
	try {
		const id = req.params.id;
		const conn = await connect();

		await conn.query('DELETE from recursosActividad where id = ?', [id]);
		return res.json({
			message: 'Recurso asignado a la actividad eliminado exitosamente!'
		});
	}
	catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error',
			error
		});
	}
	
}
