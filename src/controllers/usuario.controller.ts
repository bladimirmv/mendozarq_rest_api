import { Response, Request } from 'express';
import generator from 'generate-password';
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';

import { connect } from './../database';
import { Usuario } from '../models/usuario.interface';
import { Credenciales } from './../models/credenciales.interface';

// ===================================================================================================
export async function addUsuario(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuario: Usuario = req.body;
		const contrasenha = usuario.contrasenha;
		if (usuario.generarCredenciales === true && usuario.nombre) {
			// generating credentials
			usuario.username = `${generator.generate({ length: 2, numbers: true })}_${usuario.nombre?.replace(/\s/g, '.')}${generator.generate({ length: 3, numbers: true })}`
			usuario.contrasenha = generator.generate({ length: 10, numbers: true });
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
		const findUsername = await conn.query('select username from usuario where username = ?', [usuario.username]);
		if (findUsername[0].length) {
			return res.status(400).json({
				message: 'El nombre de usuario ya esta en uso.',
				error: '400'
			});
		} else {
			delete usuario.generarCredenciales;
			// adding usuario
			await conn.query('INSERT INTO usuario SET ?', [usuario]);
			return res.status(201).json({
				message: 'Usuario creado correctamente.',
				body: usuario
			});
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
		const conn = await connect();

		const usuario = await conn.query('select  * from usuario where uuid = ?', [uuid]);

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
export async function getAllUsuarios(res: Response) {
	try {
		const conn = await connect();
		const usuarios = await conn.query('select * from usuario order by creadoEn;');
		return res.json(usuarios[0]);
	} catch (error) {
		return res.status(400).json({
			message: 'Ocurrio un error.',
			error
		});
	}
}

export async function updateUsuario(req: Request, res: Response) {
	try {
		const uuid = req.params.id;
		const conn = await connect();
		const usuario: Usuario = req.body;

		delete usuario.uuid, usuario.generarCredenciales;
		// checking username
		const findUsername = await conn.query('select username from usuario where username = ?', [usuario.username]);
		if (findUsername[0].length) {
			return res.status(400).json({
				message: 'El nombre de usuario ya esta en uso.',
			});
		} else {
			delete usuario.generarCredenciales;
			// adding usuario
			await conn.query('INSERT INTO usuario SET ?', [usuario]);
			return res.status(201).json({
				message: 'Usuario creado correctamente.',
				body: usuario
			});

			await conn.query('update usuario set ? where id = ?', [usuario, uuid]);
			return res.json({
				message: 'post updated'
			});

		}


	} catch (error) {

	}

}


export async function deleteUsuario(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from usuario where id = ?', [id]);
	return res.json({
		message: 'post deleted'
	});
}
