import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';
import { ObservacionesByPersonal, ObservacionPersonal } from './../../models/mendozarq/observacion.personal.interface';

// ====================> addObservacionPersonal
export const addObservacionPersonal = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const observacionPersonal: ObservacionPersonal = req.body;


		if (!observacionPersonal.uuidPersonal || !observacionPersonal.uuidVisita || !observacionPersonal.descripcion) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese los datos de la observacion del personal. 🙁'
			});
		}

		observacionPersonal.uuid = uuid();


		await conn.query('INSERT INTO observacionPersonal SET ?', [observacionPersonal]);

		return res.status(201).json({
			message: 'Observacion creado exitosamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getOneObservacionPersonal
export const getOneObservacionPersonal = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[observacionPersonal]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM observacionPersonal WHERE uuid = ?', [uuid]);

		return observacionPersonal
			? res.status(200).json(observacionPersonal)
			: res.status(404).json({ message: 'No se encontro la observacion del personal. 🙁' });

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getAllObservacionPersonal
export const getAllObservacionPersonal = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		let observacionPersonal: ObservacionesByPersonal[] = [];


		const [personal_rows]: [any[], FieldPacket[]] = await conn.query(`
			SELECT p.* FROM personal AS p
				INNER JOIN personalProyecto pp ON p.uuid = pp.uuidPersonal
				INNER JOIN proyecto proy ON pp.uuidProyecto = proy.uuid
				INNER JOIN visitaProyecto vp ON proy.uuid = vp.uuidProyecto
			WHERE vp.uuid = ? ORDER BY pp.creadoEn DESC;`, [uuid]);

		const [obsr_rows]: [any[], FieldPacket[]] = await conn.query(`
			SELECT op.* FROM observacionPersonal AS op
				INNER JOIN visitaProyecto vp on op.uuidVisita = vp.uuid
			WHERE vp.uuid = ? ORDER BY op.creadoEn DESC;`, [uuid]);


		personal_rows.forEach((personal: ObservacionesByPersonal) => {
			personal.observaciones = obsr_rows.filter((observacion: ObservacionPersonal) => personal.uuid === observacion.uuidPersonal);
			observacionPersonal.push(personal);
		});

		return res.status(200).json(observacionPersonal);

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> updateObservacionPersonal
export const updateObservacionPersonal = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		const observacionPersonal: ObservacionPersonal = req.body;

		const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM observacionPersonal WHERE uuid = ?', [uuid]);

		if (!row) {
			return res.status(404).json({
				message: 'No se pudo actualizar observacion del personal, por que no existe. 🙁'
			});
		}

		await conn.query('UPDATE observacionPersonal SET ? WHERE uuid = ?', [observacionPersonal, uuid]);

		return res.status(200).json({
			message: 'Observacion actualizado correctamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getAllPersonalProyecto
export const getAllPersonalProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [personalProyecto]: [any[], FieldPacket[]] = await conn.query(`
			SELECT p.* FROM personal AS p
				INNER JOIN personalProyecto pp ON p.uuid = pp.uuidPersonal
				INNER JOIN proyecto proy ON pp.uuidProyecto = proy.uuid
				INNER JOIN visitaProyecto vp ON proy.uuid = vp.uuidProyecto
			WHERE vp.uuid = ? ORDER BY pp.creadoEn DESC;`, [uuid]);

		return res.status(200).json(personalProyecto);

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}
// ====================> deleteObservacionPersonal
export const deleteObservacionPersonal = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM observacionPersonal WHERE uuid = ?', [uuid]);

		if (!row) {
			return res.status(404).json({
				message: 'No se pudo eliminar la observacion del personal, por que no existe. 🙁'
			});
		}

		await conn.query('DELETE FROM observacionPersonal WHERE uuid = ?', [uuid]);

		return res.status(200).json({
			message: 'Servicio eliminado correctamente. 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}


