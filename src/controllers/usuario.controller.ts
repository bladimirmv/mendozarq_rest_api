import { Response, Request } from 'express';
import generatorPwd from 'generate-password';

import { connect } from './../database';
import { Usuario } from '../models/usuario.interface';
import { Credenciales } from './../models/credenciales.interface';


export async function addUsuario(req: Request, res: Response) {
	try {
		// const conn = await connect();
		const usuario: Usuario = req.body;
		console.log(req.body);

		if (usuario.generarCredenciales === true) {
			usuario.contrasenha = generatorPwd.generate({ length: 10, numbers: true });
			console.log('se genero');
			console.log('ss', usuario);
			return res.send(usuario);

		} else {
			return res.send({ usuario, esta: 'no funciono' })
		}


		// if (!usuario.contrasenha || !usuario.username || !usuario.rol) {
		// 	return res.status(400).json({
		// 		message: 'Por favor ingrese los campos requeridos.',
		// 		data: usuario
		// 	});
		// }
		// // encrypting contrasenha
		// const salt = await bcrypt.genSalt(10);
		// const hash = await bcrypt.hash(usuario.contrasenha, salt);
		// usuario.contrasenha = hash;
		// // generate uuid
		// usuario.uuid = uuid();
		// // checking username
		// const findUsername = await conn.query('select username from usuario where username = ?', [usuario.username]);

		// if (findUsername[0].length) {
		// 	return res.status(400).json({
		// 		message: 'El nombre de usuario ya esta en uso.',
		// 	});
		// } else {
		// 	await conn.query('INSERT INTO usuario SET ?', [usuario]);
		// 	return res.status(201).json({
		// 		message: 'Usuario creado correctamente.',
		// 		data: usuario
		// 	});
		// }
	} catch (error) {
		return res.status(400).json({
			message: error
		});
	}
}

export async function getUsuario(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	const post = await conn.query('select  * from posts where id = ?', [id]);

	return res.json(post[0]);
}

export async function getAllUsuarios(req: Request, res: Response) {
	try {

		const conn = await connect();
		const posts = await conn.query('select  * from posts;');
		return res.json(posts[0]);

	} catch (error) {
		return error;
	}
}

export async function updateUsuario(req: Request, res: Response) {
	// const id = req.params.id;
	// const conn = await connect();
	// const data: post = req.body;
	// await conn.query('update posts set ? where id = ?', [data, id]);
	// return res.json({
	// 	message: 'post updated'
	// });
}


export async function deleteUsuario(req: Request, res: Response) {
	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from posts where id = ?', [id]);
	return res.json({
		message: 'post deleted'
	});
}
