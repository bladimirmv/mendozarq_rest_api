import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';
import { ServicioProyecto } from './../../models/mendozarq/servicio.proyecto.interface';



// ====================> addServicioProyecto
export const addServicioProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const servicioProyecto: ServicioProyecto = req.body;

		if (!servicioProyecto.nombre) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese los datos del servicio. 🙁'
			});
		}

		servicioProyecto.uuid = uuid();

		await conn.query('INSERT INTO servicioProyecto SET ?', [servicioProyecto]);

		return res.status(201).json({
			message: 'Servicio creado exitosamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getOneServicioProyecto
export const getOneServicioProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[servicioProyecto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM servicioProyecto WHERE uuid = ?', [uuid]);

		return servicioProyecto
			? res.status(200).json(servicioProyecto)
			: res.status(404).json({ message: 'No se encontro el servicio. 🙁' });

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getAllServicioProyecto
export const getAllServicioProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [servicioProyecto]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM servicioProyecto WHERE uuidProyecto = ? ORDER BY creadoEn DESC', [uuid]);

		return res.status(200).json(servicioProyecto);

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> updateServicioProyecto
export const updateServicioProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		const servicioProyecto: ServicioProyecto = req.body;

		const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM servicioProyecto WHERE uuid = ?', [uuid]);

		if (!row) {
			return res.status(404).json({
				message: 'No se pudo actualizar el servicio, por que no existe. 🙁'
			});
		}

		await conn.query('UPDATE servicioProyecto SET ? WHERE uuid = ?', [servicioProyecto, uuid]);

		return res.status(200).json({
			message: 'Servicio actualizado correctamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> deleteServicioProyecto
export const deleteServicioProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM servicioProyecto WHERE uuid = ?', [uuid]);

		if (!row) {
			return res.status(404).json({
				message: 'No se pudo eliminar el servicioproyecto, por que no existe. 🙁'
			});
		}

		await conn.query('DELETE FROM servicioProyecto WHERE uuid = ?', [uuid]);

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


