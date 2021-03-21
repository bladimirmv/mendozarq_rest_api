import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';
import { Usuario } from '../../models/auth/usuario.interface';

import { connect } from './../../classes/database';
import { ParticipanteVisita, UsuarioVisita } from './../../models/mendozarq/participante.visita.interface';


// ====================> addParticipanteVisita
export const addParticipanteVisita = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const participanteVisita: ParticipanteVisita[] = req.body;

		participanteVisita.forEach((pv: ParticipanteVisita) => {
			if (!pv.uuidUsuario || !pv.uuidVisitaProyecto) {
				return res.status(400).json({
					message: 'No se ha podido registrar, por favor ingrese el uuid de la visita y del usuario. 🙁'
				});
			}
		});

		participanteVisita.forEach(async (pv: ParticipanteVisita) => {
			pv.uuid = uuid();
			await conn.query('INSERT INTO participanteVisita SET ?', [pv]);
		});


		return res.status(201).json({
			message: 'Usuario añadido a la visita exitosamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getAllParticipanteVisita
export const getAllParticipanteVisita = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [rows]: [any[], FieldPacket[]] = await
			conn.query(`SELECT pv.uuid AS uuidParticipanteVisita, u.* FROM participanteVisita as pv
					INNER JOIN usuario u on pv.uuidUsuario = u.uuid
					INNER join visitaProyecto vp on pv.uuidVisitaProyecto = vp.uuid
					WHERE vp.uuid = ? ORDER BY pv.creadoEn DESC`, [uuid]);

		const usuarioVisita: UsuarioVisita[] = rows as UsuarioVisita[];

		return res.status(200).json(usuarioVisita);

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================>  getAllUsuarioByUuidVisita
export const getAllUsuarioByUuidVisita = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [rows]: [any[], FieldPacket[]] = await
			conn.query(`SELECT u.* FROM usuario AS u
         INNER JOIN usuarioProyecto up ON u.uuid = up.uuidUsuario
         INNER JOIN proyecto p ON up.uuidProyecto = p.uuid
         INNER JOIN visitaProyecto vp ON vp.uuidProyecto = p.uuid
					WHERE vp.uuid = ?
  					AND u.uuid NOT IN (SELECT pv.uuidUsuario FROM participanteVisita AS pv WHERE pv.uuidVisitaProyecto = ?);`, [uuid, uuid]);

		const usuario: Usuario[] = rows as Usuario[];

		return res.status(200).json(usuario);

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}


// ====================> deleteParticipanteVisita
export const deleteParticipanteVisita = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;


		const [[participanteVisita]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM participanteVisita WHERE uuid = ?', [uuid]);


		if (participanteVisita) {
			await conn.query('DELETE FROM participanteVisita WHERE uuid = ?', [uuid]);

			return res.status(200).json({
				message: 'Usuario eliminado de la visita correctamente. 😀'
			});

		}

		return res.status(404).json({
			message: 'No se pudo eliminar el usuario de la visita, por que no existe. 🙁'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}
