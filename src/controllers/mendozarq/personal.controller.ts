import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';
import { Personal } from './../../models/mendozarq/personal.interface';



// ====================> addPersonal
export const addPersonal = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const personal: Personal = req.body;
		if (!personal.nombre) {
			// conn.end();
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese los datos del personal. 🙁'
			});
		}

		personal.uuid = uuid();

		await conn.query('INSERT INTO personal SET ?', [personal]);
		// conn.end();

		return res.status(201).json({
			message: 'Personal creado exitosamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getOnePersonal
export const getOnePersonal = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[personal]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM personal WHERE uuid = ?', [uuid]);

		if (personal) {
			return res.status(200).json(personal);
		} else {
			return res.status(404).json({
				message: 'No se encontro el personal. 🙁'
			});
		}

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getAllPersonal
export const getAllPersonal = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();

		const [personal]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM personal ORDER BY creadoEn DESC');

		return res.status(200).json(personal);

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> updatePersonal
export const updatePersonal = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		const personal: Personal = req.body;

		const [[personalFound]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM personal WHERE uuid = ?', [uuid]);

		if (personalFound) {
			await conn.query('UPDATE personal SET ? WHERE uuid = ?', [personal, uuid]);
			// conn.end();

			return res.status(200).json({
				message: 'Personal actualizado correctamente! 😀'
			});

		} else {
			// conn.end();
			return res.status(404).json({
				message: 'No se pudo actualizar el personal, por que no existe. 🙁'
			});
		}


	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> deletePersonal
export const deletePersonal = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[personal]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM personal WHERE uuid = ?', [uuid]);

		if (personal) {
			await conn.query('DELETE FROM personal WHERE uuid = ?', [uuid]);

			return res.status(200).json({
				message: 'Personal eliminado correctamente. 😀'
			});

		} else {

			return res.status(404).json({
				message: 'No se pudo eliminar el personal, por que no existe. 🙁'
			});
		}

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}


