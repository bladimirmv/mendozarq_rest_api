import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';
import { ServicioProyecto } from '../../models/mendozarq/servicio.proyecto.interface';

import { connect } from './../../classes/database';
import { ObservacionServicio } from './../../models/mendozarq/observacion.servicio.interface';



// ====================> addObservacionServicio
export const addObservacionServicio = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const observacionServicio: ObservacionServicio = req.body;

		if (!observacionServicio.uuidServicio || !observacionServicio.uuidVisita || !observacionServicio.descripcion) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese los datos de la observacion del servicio. 🙁'
			});
		}

		observacionServicio.uuid = uuid();


		await conn.query('INSERT INTO observacionServicio SET ?', [observacionServicio]);

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

// ====================> getOneObservacionServicio
export const getOneObservacionServicio = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[observacionServicio]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM observacionServicio WHERE uuid = ?', [uuid]);

		return observacionServicio
			? res.status(200).json(observacionServicio)
			: res.status(404).json({ message: 'No se encontro la observacion del servicio. 🙁' });

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getAllObservacionServicio
export const getAllObservacionServicio = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		let observacionServicio: {
			servicio?: ServicioProyecto,
			observaciones?: ObservacionServicio[]
		}[] = [];


		const [servs_rows]: [any[], FieldPacket[]] = await conn.query(`
			SELECT sp.* FROM servicioProyecto as sp
			INNER JOIN proyecto p on sp.uuidProyecto = p.uuid
			INNER JOIN visitaProyecto vp on p.uuid = vp.uuidProyecto
			WHERE vp.uuid = ?
			ORDER BY creadoEn DESC;`, [uuid]);

		const [obsr_rows]: [any[], FieldPacket[]] = await conn.query(`
			SELECT os.* FROM observacionServicio AS os
			INNER JOIN visitaProyecto vp on os.uuidVisita = vp.uuid
			WHERE vp.uuid = ?
			ORDER BY creadoEn DESC;`, [uuid]);


		servs_rows.forEach((servicio: ServicioProyecto) => {
			observacionServicio.push({
				servicio: servicio,
				observaciones: obsr_rows.filter((observacion: ObservacionServicio) => servicio.uuid === observacion.uuidServicio)
			});
		});


		return res.status(200).json(observacionServicio);

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> updateObservacionServicio
export const updateObservacionServicio = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		const observacionServicio: ObservacionServicio = req.body;

		const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM observacionServicio WHERE uuid = ?', [uuid]);

		if (!row) {
			return res.status(404).json({
				message: 'No se pudo actualizar observacion del servicio, por que no existe. 🙁'
			});
		}

		await conn.query('UPDATE observacionServicio SET ? WHERE uuid = ?', [observacionServicio, uuid]);

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

// ====================> deleteObservacionServicio
export const deleteObservacionServicio = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM observacionServicio WHERE uuid = ?', [uuid]);

		if (!row) {
			return res.status(404).json({
				message: 'No se pudo eliminar la observacion del servicio, por que no existe. 🙁'
			});
		}

		await conn.query('DELETE FROM observacionServicio WHERE uuid = ?', [uuid]);

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


