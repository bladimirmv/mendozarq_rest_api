import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';
import { connect } from './../../classes/database';

import { CategoriaProducto } from './../../models/liraki/categoria.producto.interface';

export const addCategoriaProducto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const categoriaProducto: CategoriaProducto = req.body;
		console.log(categoriaProducto);


		if (!categoriaProducto.nombre) {
			return res.status(400).json({
				message: `No se ha podido registrar, por favor ingrese los datos de la categoria. 🙁 ${categoriaProducto.nombre}`
			});
		}

		categoriaProducto.uuid = uuid();

		await conn.query('INSERT INTO categoriaProducto SET ?', [categoriaProducto]);


		return res.status(201).json({
			message: 'Categoria creado exitosamente! 😀'
		});
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
};


export const getOneCategoriaProducto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[categoriaProducto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM categoriaProducto WHERE uuid = ?', [uuid]);

		return categoriaProducto
			? res.status(200).json(categoriaProducto)
			: res.status(404).json({ message: 'No se encontro la categoria. 🙁' });

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

export const getAllcategoriaProducto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();

		const [categoriaProducto]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM categoriaProducto');

		return res.status(200).json(categoriaProducto);
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

export const updatecategoriaProducto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		const categoriaProducto: CategoriaProducto = req.body;

		const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM categoriaProducto WHERE uuid = ?', [uuid]);

		if (!row) {
			return res.status(404).json({
				message: 'No se pudo actualizar la categoria, por que no existe. 🙁'
			});
		}

		await conn.query('UPDATE categoriaProducto SET ? WHERE uuid = ?', [categoriaProducto, uuid]);

		return res.status(200).json({
			message: 'Categoria actualizado correctamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

export const deletecategoriaProducto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM categoriaProducto WHERE uuid = ?', [uuid]);

		if (!row) {
			return res.status(404).json({
				message: 'No se pudo eliminar la categoria, por que no existe. 🙁'
			});
		}

		await conn.query('DELETE FROM categoriaProducto WHERE uuid = ?', [uuid]);

		return res.status(200).json({
			message: 'Categoria eliminado correctamente. 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}
