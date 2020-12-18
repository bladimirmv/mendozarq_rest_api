import { Response, Request } from 'express';
import generator from 'generate-password';
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';
import { Pool } from 'mysql2/promise';

import { connect } from '../../database';
import { Usuario } from '../../models/usuario.interface';

// ===================================================================================================
function generateUsuario(usuario: Usuario): Usuario {
	usuario.username = `${generator.generate({ length: 2, numbers: true })}_${usuario.nombre?.replace(/\s/g, '.')}${generator.generate({ length: 3, numbers: true })}`
	return usuario;
}
// ===================================================================================================
function generateContrasenha(usuario: Usuario): Usuario {
	usuario.contrasenha = generator.generate({ length: 10, numbers: true });
	return usuario;
}
// ===================================================================================================
export async function addUsuario(req: Request, res: Response) {

	try {
		const conn: Pool = await connect();
		let usuario: Usuario = req.body;
		let { contrasenha, username } = usuario;


		if (usuario.autoUsuario && usuario.nombre) {
			usuario = generateUsuario(usuario);
			username = usuario.username;
		}
		if (usuario.autoContrasenha) {
			usuario = generateContrasenha(usuario);
			contrasenha = usuario.contrasenha;
		}

		if (!usuario.contrasenha || !usuario.username || !usuario.rol || !usuario.nombre) {
			return res.status(400).json({
				message: 'Por favor ingrese los campos requeridos.',
				error: '400',
				body: usuario
			});
		}
		// encrypting contrasenha
		const salt = await bcrypt.genSalt(10);
		const hash = await bcrypt.hash(usuario.contrasenha, salt);
		usuario.contrasenha = hash;
		// generate uuid
		usuario.uuid = uuid();
		// checking username
		const findUsername: any = await conn.query('select username from usuario where username = ?', [usuario.username]);

		if (findUsername[0].length) {
			conn.end();
			return res.status(400).json({
				message: `El username \'${usuario.username}\' ya esta en uso, porfavor ingrese otro valido o active la opcion de generar automaticamente.`,
				error: 'Bad request 400'
			});
		} else {

			delete usuario.autoUsuario
			delete usuario.autoContrasenha;
			// adding usuario
			await conn.query('INSERT INTO usuario SET ?', [usuario]);
			conn.end();
			// adding contrasenha and usuario
			usuario.username = username;
			usuario.contrasenha = contrasenha;
			// response
			return res.status(201).send(usuario);
		}

	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function getUsuario(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn: Pool = await connect();

		const usuario: any = await conn.query('select  * from usuario where uuid = ?', [uuid]);
		conn.end();
		if (usuario[0].length) {

			res.send(usuario[0]);
		} else {
			return res.status(404).json({
				message: 'No se encontro el usuario.',
				error: '404'
			});
		}

	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error',
			error
		});
	}
}
// ===================================================================================================
export async function getAllUsuarios(req: Request, res: Response) {

	try {
		const conn: Pool = await connect();
		const usuarios: any = await conn.query('select * from usuario order by creadoEn desc');
		conn.end();
		return res.send(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}
// ===================================================================================================
export async function updateUsuario(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn: Pool = await connect();
		let usuario: Usuario = req.body;
		let { contrasenha, username } = usuario;


		if (usuario.autoUsuario && usuario.nombre) {
			usuario = generateUsuario(usuario);
			username = usuario.username;
		}
		if (usuario.autoContrasenha) {
			usuario = generateContrasenha(usuario);
			contrasenha = usuario.contrasenha;
		}

		if (!usuario.username || !usuario.rol || !usuario.nombre) {
			return res.status(400).json({
				message: 'Por favor ingrese los campos requeridos.',
				error: '400',
				body: usuario
			});
		}
		// encrypting contrasenha
		if (contrasenha) {
			const salt = await bcrypt.genSalt(10);
			const hash = await bcrypt.hash(usuario.contrasenha, salt);
			usuario.contrasenha = hash;
		}

		// checking username
		const findUsername: any = await conn.query('select * from usuario where username = ?', [usuario.username]);
		const usr: Usuario = findUsername[0][0];


		if (findUsername[0].length && usr.uuid !== uuid) {
			conn.end();
			return res.status(400).json({
				message: `El username \'${usuario.username}\' ya esta en uso, porfavor ingrese otro valido o active la opcion de generar automaticamente.`,
				error: 'Bad request 400'
			});
		} else {

			delete usuario.autoUsuario
			delete usuario.autoContrasenha;

			// updating usuario
			console.log('esty insertando esto: ', usuario);

			await conn.query('update usuario set ? where uuid = ?', [usuario, uuid]);
			conn.end();
			// adding contrasenha and usuario
			usuario.username = username;
			usuario.contrasenha = contrasenha;
			// response
			return res.status(201).send(usuario);
		}







		// await conn.query('update usuario set ? where id = ?', [usuario, uuid]);
		// return res.json({
		// 	message: 'post updated'
		// });

	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}

}
// ===================================================================================================
export async function deleteUsuario(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from usuario where uuid = ?', [id]);
	return res.json({
		message: 'post deleted'
	});
}
// ===================================================================================================