import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';
import { CapituloPresupuesto, CapituloPresupuestoView, DetalleCapitulo, PresupuestoObra } from './../../models/mendozarq/presupuestos.interface';

// ====================>
export const addCapituloPresupuesto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const capituloPresupuesto: CapituloPresupuesto = req.body;


		if (!capituloPresupuesto.nombre || !capituloPresupuesto.uuidPresupuestoObra) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese los datos del capitulo. 🙁'
			});
		}

		capituloPresupuesto.uuid = uuid();

		await conn.query('INSERT INTO capituloPresupuesto SET ?', [capituloPresupuesto]);

		return res.status(201).json({
			message: 'Capitulo creado exitosamente! 😀'
		});
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
};

// ====================>
export const getOneCapituloPresupuesto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[presupuestoobra]]: [any[], FieldPacket[]] = await conn.query(`SELECT * FROM capituloPresupuesto WHERE uuid = ?`, [uuid]);

		return presupuestoobra
			? res.status(200).json(presupuestoobra)
			: res.status(404).json({
				message: 'No se encontro el capitulo. 🙁'
			});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> 
export const getAllCapituloPresupuesto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		let capitulosView: CapituloPresupuesto[] = [];


		const [capituloRows]: [any[], FieldPacket[]] = await conn.query(`
		SELECT * FROM capituloPresupuesto WHERE uuidPresupuestoObra = ? ORDER BY creadoEn;`, [uuid]);

		const [detalleRows]: [any[], FieldPacket[]] = await conn.query(`
		SELECT * FROM detalleCapitulo AS dc
			INNER JOIN capituloPresupuesto cp on dc.uuidCapituloPresupuesto = cp.uuid
			WHERE cp.uuidPresupuestoObra = ? ORDER BY  dc.creadoEn;`, [uuid]);


		capituloRows.forEach((capituloPresupuesto: CapituloPresupuestoView) => {
			capituloPresupuesto.detalles = detalleRows.filter((detalleCapitulo: DetalleCapitulo) => capituloPresupuesto.uuid === detalleCapitulo.uuidCapituloPresupuesto);
			capitulosView.push(capituloPresupuesto);
		});


		return res.status(200).json(capitulosView);
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> 
export const updateCapituloPresupuesto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		const presupuestoObra: PresupuestoObra = req.body;

		const [[presupuesto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM capituloPresupuesto WHERE uuid = ?', [uuid]);

		if (presupuesto) {
			await conn.query('UPDATE capituloPresupuesto SET ? WHERE uuid = ?', [presupuestoObra, uuid]);
			return res.status(200).json({
				message: 'Capitulo actualizado correctamente! 😀'
			});
		}
		return res.status(404).json({
			message: 'No se pudo actualizar el capitulo, por que no existe. 🙁'
		});
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> 
export const deleteCapituloPresupuesto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[presupuesto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM capituloPresupuesto WHERE uuid = ?', [uuid]);

		if (presupuesto) {
			await conn.query('DELETE FROM capituloPresupuesto WHERE uuid = ?', [uuid]);
			return res.status(200).json({
				message: 'Capitulo eliminado correctamente. 😀'
			});
		}

		return res.status(404).json({
			message: 'No se pudo eliminar el capitulo, por que no existe. 🙁'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}