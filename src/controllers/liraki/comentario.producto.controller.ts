import { Request, Response } from "express";
import { Pool } from "mysql2/promise";
import { connect } from "../../classes/database";
import { ComentarioProducto } from "../../models/liraki/comentario.producto.interface";
import { v4 as uuid } from 'uuid';
import { FieldPacket } from "mysql";


export const addComentarioProducto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const comentario: ComentarioProducto = req.body;

		if (!comentario.titulo || !comentario.descripcion || comentario.uuidCliente || comentario.uuidProducto) {
			return res.status(400).json({
				message: `No se ha podido registrar, por favor ingrese los datos del comentario. 🙁`,
			});
		}

		comentario.uuid = uuid();

		await conn.query(`INSERT INTO comentarioProducto SET ? `, [comentario]);

		return res.status(201).json({
			message: "Comentario creado exitosamente! 😀",
		});

	} catch (error) {
		console.log("❌Ocurrio un error:", error);
		return res.status(400).json({
			message: error
		});
	}
}

export const getAllComentarioProducto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();

		const [comentarrio]: [any[], FieldPacket[]] = await conn.query(
			`SELECT * FROM comentarioProducto ORDER BY creadoEn DESC`
		);

		return res.status(200).json(comentarrio);
	} catch (error) {
		console.log("❌Ocurrio un error:", error);
		return res.status(400).json({
			message: error
		});
	}
};

export const deleteComentarioProducto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[row]]: [any[], FieldPacket[]] = await conn.query(
			`SELECT * FROM comentarioProducto WHERE uuid = ?`,
			[uuid]
		);

		if (!row) {
			return res.status(404).json({
				message: "No se pudo eliminar el comentario, por que no existe. 🙁",
			});
		}

		await conn.query(`DELETE FROM comentarioProducto WHERE uuid = ?`, [uuid]);

		return res.status(200).json({
			message: "Comentario eliminado correctamente. 😀",
		});
	} catch (error) {
		console.log("❌Ocurrio un error:", error);
		return res.status(400).json({
			message: error
		});
	}
};

