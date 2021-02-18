import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { async } from 'rxjs';
import { v4 as uuid } from 'uuid';

import { connect } from '../../classes/database';
import { PersonalProyecto } from '../../models/mendozarq/participante.proyecto.interface';
import { Personal } from '../../models/mendozarq/personal.interface';


// ====================> addPersonalProyecto
export const addPersonalProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const personalProyecto: PersonalProyecto[] = req.body;


		personalProyecto.forEach((personal: PersonalProyecto) => {
			if (!personal.uuidProyecto || !personal.uuidPersonal) {
				return res.status(400).json({
					message: 'No se ha podido registrar, por favor ingrese el uuid del proyecto y del personal. 🙁'
				});
			}
		});


		personalProyecto.forEach(async (personal: PersonalProyecto) => {
			personal.uuid = uuid();
			await conn.query('INSERT INTO personalProyecto SET ?', [personal]);
		});


		return res.status(201).json({
			message: 'Personal añadido al proyecto exitosamente! 😀'
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

		const [rows]: [any[], FieldPacket[]] = await
			conn.query(`SELECT pp.uuid AS uuidPersonalProyecto, per.* FROM personalProyecto AS pp
			INNER JOIN proyecto AS p ON pp.uuidProyecto = p.uuid
			INNER JOIN personal per ON pp.uuidPersonal = per.uuid
			WHERE p.uuid = ? ORDER BY creadoEn DESC`, [uuid]);

		const personal: Personal[] = rows as Personal[];

		return res.status(200).json(personal);

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getAllPersonalByUuid
export const getAllPersonalByUuid = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [rows]: [any[], FieldPacket[]] = await
			conn.query(`SELECT * FROM personal AS p
					WHERE p.uuid NOT IN
								(SELECT pp.uuidPersonal
								FROM personalProyecto AS pp
								WHERE pp.uuidProyecto = ?)
					ORDER BY creadoEn DESC;`, [uuid]);

		const personal: Personal[] = rows as Personal[];

		return res.status(200).json(personal);

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> deletePersonalProyecto
export const deletePersonalProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;


		const [[personalProyecto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM personalProyecto WHERE uuid = ?', [uuid]);


		if (personalProyecto) {
			await conn.query('DELETE FROM personalProyecto WHERE uuid = ?', [uuid]);

			return res.status(200).json({
				message: 'Personal eliminado del proyecto correctamente. 😀'
			});

		}

		return res.status(404).json({
			message: 'No se pudo eliminar el personal del proyecto, por que no existe. 🙁'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}