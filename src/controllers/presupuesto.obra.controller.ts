import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../database';
import { PresupuestoDeObra } from './../models/presupuesto.obra.interface';

// ===================================================================================================
export async function addPresupuestoDeObra(req: Request, res: Response) {
	try {
		const conn = await connect();
		const presupuesto: PresupuestoDeObra = req.body;

		// generate uuid
		presupuesto.idPresupuesto = uuid();

		await conn.query('INSERT INTO presupuestoDeObra SET ?', [presupuesto]);
		return res.status(201).json({
			message: 'Presupuesto de obra creado correctamente.',
			body: presupuesto
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getPresupuestoDeObra(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('select  * from presupuestoDeObra where idProyecto = ?', [uuid]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontro un presupuesto para la obra ingresada.',
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
export async function getAllPresupuestosDeObra(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuarios = await conn.query('select * from presupuestoDeObra order by creadoEn;');
		return res.json(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}

export async function updatePresupuestoDeObra(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const presupuesto: PresupuestoDeObra = req.body;

		// delete recurso.idRecurso porque estamos borrando estos id's?
	    
			// adding usuario
			await conn.query('UPDATE presupuestoDeObra SET ? WHERE idPresupuesto = ?', [presupuesto, presupuesto.idPresupuesto]);
			return res.status(201).json({
				message: 'Presupuesto de obra modificado correctamente.',
				body: presupuesto
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


export async function deletePresupuestoDeObra(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from presupuestoDeObra where idPresupuesto = ?', [id]);
	return res.json({
		message: 'Presupuesto de obra eliminado exitosamente'
	});
}
