import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';
import { FieldPacket, Pool } from 'mysql2/promise';

import { connect } from '../../classes/database';
import { CategoriaProyecto } from '../../models/mendozarq/categoria.proyecto.interface';

// ====================> addCategoriaProyecto
export async function addCategoriaProyecto(req: Request, res: Response) {
	try {
		const conn: Pool = await connect();
		const categoriaProyecto: CategoriaProyecto = req.body;

		// generate uuid
		categoriaProyecto.uuid = uuid();

		await conn.query('INSERT INTO categoriaProyecto SET ?', [categoriaProyecto]);

		return res.status(201).json({
			message: 'Categoria creado correctamente. 😀'
		});

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: `Lo sentimos ocurrio un problema al guardar la categoria. 🙁`,
			error
		});
	}
}

// ====================> getOneCategoriaProyecto
export async function getOneCategoriaProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.uuid;
		const conn: Pool = await connect();


		const [[categoria]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM categoriaProyecto WHERE uuid = ?', [uuid]);

		return categoria
			? res.status(200).json(categoria)
			: res.status(404).json({
				message: 'No se encontro la categoria. 🙁'
			});
	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: `Lo sentimos ocurrio un problema al recuperar la categoria. 🙁`,
			error
		});
	}
}

// ====================> getAllCategoriaProyecto
export async function getAllCategoriaProyecto(req: Request, res: Response) {
	try {
		const conn: Pool = await connect();

		const [categorias]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM categoriaProyecto ORDER BY creadoEn DESC');

		return res.status(200).json(categorias);
	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: `Lo sentimos ocurrio un problema al recuperar las categorias. 🙁`,
			error
		});
	}
}

// ====================> updateCategoriaProyecto
export async function updateCategoriaProyecto(req: Request, res: Response) {
	try {
		const conn: Pool = await connect();
		const uuid = req.params.uuid;
		const categoria: CategoriaProyecto = req.body;

		const [[categoriaFound]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM categoriaProyecto WHERE uuid = ?', [uuid]);

		if (categoriaFound) {
			await conn.query('UPDATE categoriaProyecto SET ? WHERE uuid = ?', [categoria, uuid]);
			res.status(200).json({
				message: 'Categoria actulizado correctamente! 😀'
			});
		} else {
			res.status(400).json({
				message: 'No se pudo actulizar la categoria, por que no existe. 🙁'
			})
		}

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: `Lo sentimos ocurrio un problema al actualizar la categoria. 🙁`,
			error
		});
	}
}

// ====================> deleteCategoriaProyecto
export async function deleteCategoriaProyecto(req: Request, res: Response) {
	try {
		const uuid = req.params.uuid;
		const conn = await connect();

		const [[categoriaFound]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM categoriaProyecto WHERE uuid = ?', [uuid]);

		if (categoriaFound) {
			await conn.query('DELETE FROM categoriaProyecto WHERE uuid = ?', [uuid]);
			return res.json({
				message: 'Categoria eliminado correctamente! 😀'
			});
		} else {
			res.status(400).json({
				message: 'No se pudo actulizar la categoria, por que no existe. 🙁'
			})
		}

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: `Lo sentimos ocurrio un problema al eliminar la categoria. 🙁`,
			error
		});
	}
}
