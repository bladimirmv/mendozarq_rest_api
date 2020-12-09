import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../database';
import { DetallePresupuesto } from './../models/detalle.presupuesto.interface';

// ===================================================================================================
export async function addDetallePresupuestoDeObra(req: Request, res: Response) {
	try {
		const conn = await connect();
		const detallePresupuesto: DetallePresupuesto = req.body;

		// generate uuid
		detallePresupuesto.idPresupuesto = uuid();

		await conn.query('INSERT INTO detallePresupuesto SET ?', [detallePresupuesto]);
		return res.status(201).json({
			message: 'Detalle de presupuesto de obra creado correctamente.',
			body: detallePresupuesto
		});


	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getDetallePresupuestoDeObra(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();

		const usuario = await conn.query('select  * from detallePresupuesto where idPresupuesto = ?', [uuid]);

		if (usuario[0].length) {
			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontro un detalle de presupuesto para la obra ingresada.',
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
export async function getAllDetallePresupuestosDeObra(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuarios = await conn.query('select * from detallePresupuesto order by creadoEn;');
		return res.json(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}

export async function updateDetallePresupuestoDeObra(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const detallePresupuesto: DetallePresupuesto = req.body;

		// delete recurso.idRecurso porque estamos borrando estos id's?
	    
			// adding usuario
			await conn.query('UPDATE detallePresupuesto SET ? WHERE idDetallePresupuesto = ?', [detallePresupuesto, detallePresupuesto.idPresupuesto]);
			return res.status(201).json({
				message: 'Detalle de presupuesto de obra modificado correctamente.',
				body: detallePresupuesto
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


export async function deleteDetallePresupuestoDeObra(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from detallePresupuesto where idDetallePresupuesto = ?', [id]);
	return res.json({
		message: 'Detalle de presupuesto de obra eliminado exitosamente'
	});
}
