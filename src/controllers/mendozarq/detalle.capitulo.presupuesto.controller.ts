import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';
import { DetalleCapitulo, PresupuestoObra } from './../../models/mendozarq/presupuestos.interface';

// ====================>
export const addDetalleCapituloPresupuesto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const detalleCapituloPresupuesto: DetalleCapitulo = req.body;


		if (!detalleCapituloPresupuesto.descripcion || !detalleCapituloPresupuesto.uuidCapituloPresupuesto) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese los datos del detalle. 🙁'
			});
		}

		detalleCapituloPresupuesto.uuid = uuid();

		await conn.query('INSERT INTO detalleCapitulo SET ?', [detalleCapituloPresupuesto]);

		return res.status(201).json({
			message: 'Detalle creado exitosamente! 😀'
		});
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
};

// ====================>
export const getOneDetalleCapituloPresupuesto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[detalleCapitulo]]: [any[], FieldPacket[]] = await conn.query(`SELECT * FROM detalleCapitulo WHERE uuid = ?`, [uuid]);

		return detalleCapitulo
			? res.status(200).json(detalleCapitulo)
			: res.status(404).json({
				message: 'No se encontro el detalle. 🙁'
			});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}


// ====================> 
export const updatedetalleCapituloPresupuesto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		const presupuestoObra: PresupuestoObra = req.body;

		const [[presupuesto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM detalleCapitulo WHERE uuid = ?', [uuid]);

		if (presupuesto) {
			await conn.query('UPDATE detalleCapitulo SET ? WHERE uuid = ?', [presupuestoObra, uuid]);
			return res.status(200).json({
				message: 'Detalle actualizado correctamente! 😀'
			});
		}
		return res.status(404).json({
			message: 'No se pudo actualizar el detalle, por que no existe. 🙁'
		});
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> 
export const deletedetalleCapituloPresupuesto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[presupuesto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM detalleCapitulo WHERE uuid = ?', [uuid]);

		if (presupuesto) {
			await conn.query('DELETE FROM detalleCapitulo WHERE uuid = ?', [uuid]);
			return res.status(200).json({
				message: 'Capitulo eliminado correctamente. 😀'
			});
		}

		return res.status(404).json({
			message: 'No se pudo eliminar el detalle, por que no existe. 🙁'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}