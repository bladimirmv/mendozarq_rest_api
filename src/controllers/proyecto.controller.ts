import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../classes/database';

import { Proyecto } from '../models/proyecto.interface';
import { Credenciales } from './../models/credenciales.interface';

// ===================================================================================================
export async function addProyecto(req: Request, res: Response) {
	try {
		const conn = await connect();
		const Proyecto: Proyecto = req.body;

		// generate uuid
		Proyecto.idProyecto = uuid();

		await conn.query('INSERT INTO proyecto SET ?', [Proyecto]);
		return res.status(201).json({
			message: 'Proyecto creado correctamente.',
			body: Proyecto
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('select  * from proyecto where idProyecto = ?', [uuid]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontro el proyecto solicitado.',
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
export async function getAllProyectos(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuarios = await conn.query('select * from proyecto order by creadoEn;');
		return res.json(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}

export async function updateProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const usuario: Proyecto = req.body;

		delete usuario.idProyecto
		// checking username
		const findUsername = await conn.query('select nombre from proyecto where nombre = ?', [usuario.nombre]);
		if (findUsername[0].length) {
			return res.status(400).json({
				message: 'El proyecto insertada ya existe.',
			});
		} else {
			// adding usuario
			await conn.query('UPDATE proyecto SET ? WHERE idProyecto = ?', [usuario, usuario.idProyecto]);
			return res.status(201).json({
				message: 'Proyecto modificado correctamente.',
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


export async function deleteProyecto(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from proyecto where id = ?', [id]);
	return res.json({
		message: 'Proyecto eliminado existosamente!'
	});
}
