import { Request, Response } from "express";
import { Pool } from "mysql2/promise";
import { connect } from "../../classes/database";
import { OpinionProducto } from "../../models/liraki/opinion.producto.interface";
import { v4 as uuid } from 'uuid';
import { FieldPacket } from "mysql";


export const addOpinionProducto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const opinion: OpinionProducto = req.body;

		console.log(opinion);


		if (!opinion.titulo || !opinion.descripcion || !opinion.uuidCliente || !opinion.uuidProducto) {
			return res.status(400).json({
				message: `No se ha podido registrar, por favor ingrese los datos del opinion. 🙁`,
			});
		}

		opinion.uuid = uuid();

		await conn.query(`INSERT INTO opinionProducto SET ? `, [opinion]);

		return res.status(201).json({
			message: "Opinion creado exitosamente! 😀",
		});

	} catch (error) {
		console.log("❌Ocurrio un error:", error);
		return res.status(400).json({
			message: error
		});
	}
}

export const getAllOpinionProducto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;



		const [comentarrio]: [any[], FieldPacket[]] = await conn.query(
			`SELECT * FROM opinionProducto WHERE uuidProducto = ? ORDER BY creadoEn DESC`, [uuid]);

		return res.status(200).json(comentarrio);
	} catch (error) {
		console.log("❌Ocurrio un error:", error);
		return res.status(400).json({
			message: error
		});
	}
};

export const deleteOpinionProducto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[row]]: [any[], FieldPacket[]] = await conn.query(
			`SELECT * FROM opinionProducto WHERE uuid = ?`,
			[uuid]
		);

		if (!row) {
			return res.status(404).json({
				message: "No se pudo eliminar el opinion, por que no existe. 🙁",
			});
		}

		await conn.query(`DELETE FROM opinionProducto WHERE uuid = ?`, [uuid]);

		return res.status(200).json({
			message: "Opinion eliminado correctamente. 😀",
		});
	} catch (error) {
		console.log("❌Ocurrio un error:", error);
		return res.status(400).json({
			message: error
		});
	}
};

