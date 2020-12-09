import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from '../database';
import { SubDetallePresupuesto } from '../models/subdetalle.presupuesto.interface';

// ===================================================================================================
export async function addSubdetallePresupuestoDeObra(req: Request, res: Response) {
	try {
		const conn = await connect();
		const subDetallePresupuesto: SubDetallePresupuesto = req.body;

		// generate uuid
		subDetallePresupuesto.idSubDetallePresupuesto = uuid();

		await conn.query('INSERT INTO subDetallePresupuesto SET ?', [subDetallePresupuesto]);
		return res.status(201).json({
			message: 'Subdetalle de presupuesto creado correctamente.',
			body: subDetallePresupuesto
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getSubdetallePresupuestoDeObra(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('select  * from subDetallePresupuesto where idDetallePresupuesto = ?', [uuid]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontro un subdetalle para el detalle ingresado.',
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
export async function getAllSubdetallePresupuestosDeObra(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuarios = await conn.query('select * from subDetallePresupuesto order by creadoEn;');
		return res.json(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}

export async function updateSubdetallePresupuestoDeObra(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const subDetallePresupuesto: SubDetallePresupuesto = req.body;

		// delete recurso.idRecurso porque estamos borrando estos id's?
	    
			// adding usuario
			await conn.query('UPDATE subDetallePresupuesto SET ? WHERE idSubDetallePresupuesto = ?', [subDetallePresupuesto, subDetallePresupuesto.idDetallePresupuesto]);
			return res.status(201).json({
				message: 'Subdetalle de presupuesto modificado correctamente.',
				body: subDetallePresupuesto
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


export async function deleteSubdetallePresupuestoDeObra(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from subDetallePresupuesto where idSubDetallePresupuesto = ?', [id]);
	return res.json({
		message: 'Subdetalle de presupuesto eliminado exitosamente'
	});
}
