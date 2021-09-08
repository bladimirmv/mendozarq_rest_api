import { Pool } from 'mysql2/promise';
import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';

import { Proyecto } from './../../models/mendozarq/proyecto.interface';
import { FieldPacket, QueryError } from 'mysql2';

// ====================> addProyecto
export async function addProyecto(req: Request, res: Response) {
	try {
		const conn: Pool = await connect();
		const proyecto: Proyecto = req.body;

		if (!proyecto.nombre && proyecto.uuidCliente) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor los datos del proyecto'
			});
		}

		proyecto.uuid = uuid();

		await conn.query('INSERT INTO proyecto SET ?', [proyecto]);

		return res.status(201).json({
			message: 'Proyecto creado correctamente. 😀'
		});

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getOneProyecto
export async function getOneProyecto(req: Request, res: Response) {
	try {
		const conn: Pool = await connect();
		const uuid = req.params.uuid;

		const [[proyecto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM proyectoWiew WHERE uuid = ?', [uuid]);

		return proyecto
			? res.status(200).json(proyecto)
			: res.status(404).json({
				message: 'No se encontro el proyecto. 🙁'
			});

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getAllProyecto
export async function getAllProyecto(req: Request, res: Response) {
	try {
		const conn: Pool = await connect();

		const [proyectos]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM proyectoWiew ORDER BY creadoEn DESC');

		return res.status(200).json(proyectos);

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> updateProyecto

export async function updateProyecto(req: Request, res: Response) {
	try {
		const conn: Pool = await connect();
		const uuid = req.params.uuid;
		const proyecto: Proyecto = req.body;

		const [[proyectoFound]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM proyecto WHERE uuid = ?', [uuid]);

		if (proyectoFound) {
			await conn.query('UPDATE proyecto SET ? WHERE uuid = ?', [proyecto, uuid]);
			res.status(200).json({
				message: 'Proyecto actulizado correctamente! 😀'
			});
		} else {
			res.status(400).json({
				message: 'No se pudo actulizar el proyecto, por que no existe. 🙁'
			})
		}

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: error
		});
	}

}

// ====================> deleteProyecto
export async function deleteProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.uuid;
		const conn = await connect();

		const [[proyectoFound]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM proyecto WHERE uuid = ?', [uuid]);

		if (proyectoFound) {
			await conn.query('DELETE FROM proyecto WHERE uuid = ?', [uuid]);
			return res.json({
				message: 'Proyecto eliminado correctamente! 😀'
			});
		} else {
			res.status(400).json({
				message: 'No se pudo actulizar el proyecto, por que no existe. 🙁'
			})
		}

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: error
		});
	}
}



