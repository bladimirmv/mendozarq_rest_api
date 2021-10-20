import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';
import { PresupuestoObra, PresupuestoObraView } from './../../models/mendozarq/presupuestos.interface';
import { Roles } from './../../models/auth/usuario.interface'


// ====================> 
export const addPresupuestoObra = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const presupuestoObra: PresupuestoObra = req.body;

		console.log(presupuestoObra)

		if (!presupuestoObra.nombre || !presupuestoObra.uuidCliente || !presupuestoObra.uuidUsuario) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese los datos del presupuesto. 🙁'
			});
		}

		presupuestoObra.uuid = uuid();

		await conn.query('INSERT INTO presupuestoObra SET ?', [presupuestoObra]);

		return res.status(201).json({
			message: 'Presupuesto creado exitosamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================>
export const getOnePresupuestoObra = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[presupuestoobra]]: [any[], FieldPacket[]] = await conn.query(`
				SELECT p.*,
							concat_ws(' ', u.nombre, u.apellidoPaterno, u.apellidoMaterno) as usuario,
								concat_ws(' ', c.nombre, c.apellidoPaterno, c.apellidoMaterno) as cliente
				FROM presupuestoObra AS p
								INNER JOIN usuario u on p.uuidUsuario = u.uuid
								INNER JOIN usuario c on p.uuidCliente = c.uuid
				WHERE p.uuid = ?`, [uuid]);

		return presupuestoobra
			? res.status(200).json(presupuestoobra)
			: res.status(404).json({
				message: 'No se encontro el presupuesto. 🙁'
			});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================>
export const getAllPresupuestoObra = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		let presupuestoObra: PresupuestoObraView[] = [];

		switch (<Roles>res.locals.rol) {
			case 'administrador':
				const [AllRows]: [any[], FieldPacket[]] = await conn.query(`
				SELECT p.*,
							concat_ws(' ', u.nombre, u.apellidoPaterno, u.apellidoMaterno) as usuario,
								concat_ws(' ', c.nombre, c.apellidoPaterno, c.apellidoMaterno) as cliente
				FROM presupuestoObra AS p
								INNER JOIN usuario u on p.uuidUsuario = u.uuid
								INNER JOIN usuario c on p.uuidCliente = c.uuid
				ORDER BY p.creadoEn DESC;`);
				presupuestoObra = AllRows as PresupuestoObraView[];
				break;

			case 'arquitecto':
				const [SelectedRows]: [any[], FieldPacket[]] = await conn.query(`
				SELECT p.*,
							concat_ws(' ', u.nombre, u.apellidoPaterno, u.apellidoMaterno) as usuario,
								concat_ws(' ', c.nombre, c.apellidoPaterno, c.apellidoMaterno) as cliente
				FROM presupuestoObra AS p
								INNER JOIN usuario u on p.uuidUsuario = u.uuid
								INNER JOIN usuario c on p.uuidCliente = c.uuid
				WHERE uuidUsuario = ?	ORDER BY p.creadoEn DESC;`, [res.locals.jwtPayload.uuid]);
				presupuestoObra = SelectedRows as PresupuestoObraView[];
				break;
			default:
				break;
		}
		return res.status(200).json(presupuestoObra);
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================>
export const updatePresupuestoObra = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		const presupuestoObra: PresupuestoObra = req.body;

		const [[presupuesto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM presupuestoObra WHERE uuid = ?', [uuid]);

		if (presupuesto) {
			await conn.query('UPDATE presupuestoObra SET ? WHERE uuid = ?', [presupuestoObra, uuid]);
			return res.status(200).json({
				message: 'Presupuesto actualizado correctamente! 😀'
			});

		}
		return res.status(404).json({
			message: 'No se pudo actualizar el presupuesto, por que no existe. 🙁'
		});
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================>
export const deletePresupuestoObra = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[presupuesto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM presupuestoObra WHERE uuid = ?', [uuid]);

		if (presupuesto) {
			await conn.query('DELETE FROM presupuestoObra WHERE uuid = ?', [uuid]);
			return res.status(200).json({
				message: 'PresupuestoObra eliminado correctamente. 😀'
			});
		}

		return res.status(404).json({
			message: 'No se pudo eliminar el presupuestoobra, por que no existe. 🙁'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

