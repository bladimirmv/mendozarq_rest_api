import { Request, Response } from "express";
import { Pool } from "mysql2/promise";
import { connect } from "../../classes/database";
import { OpinionProducto, OpinionProductoView } from "../../models/liraki/opinion.producto.interface";
import { v4 as uuid } from 'uuid';
import { FieldPacket } from "mysql";
import { Usuario } from "../../models/auth/usuario.interface";


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

export const getAllOpinionProductoByUuid = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		let opninionView: OpinionProductoView[] = [] as OpinionProductoView[];

		const [opiniones]: [any[], FieldPacket[]] = await conn.query(
			`SELECT * FROM opinionProducto WHERE uuidProducto = ? ORDER BY creadoEn DESC`, [uuid]);

		const [usuarios]: [any[], FieldPacket[]] = await conn.query(`SELECT u.* FROM opinionProducto as op
		INNER JOIN usuario u on op.uuidCliente = u.uuid
		WHERE op.uuidProducto = ? ORDER BY op.creadoEn DESC`, [uuid])

		opninionView = opiniones as OpinionProductoView[];

		opninionView.map((opinion: OpinionProductoView) => {
			opinion.usuario = usuarios.filter((usuario: Usuario) => opinion.uuidCliente === usuario.uuid)[0];
		});


		return res.status(200).json(opninionView);
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

