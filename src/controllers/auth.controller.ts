import { Request, Response } from "express";
import { connect } from './../database';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken'
import { v4 as uuid } from 'uuid';


import config from './../config/config'
import { Usuario } from "./../models/usuario.interface";

const compareContrasenha = async (contrasenha: any, toCompare: any): Promise<boolean> => {
	return await bcrypt.compare(contrasenha, '$2b$10$g81WXZNIlPb6xSHBjcYmvukRKM7LEcuSGkjpfcMLnbdtu3UgJGpbK');
}

function createToken(usuario: Usuario) {

	return jwt.sign({ id: usuario.uuid, username: usuario.username }, config.jwtSecret, {
		expiresIn: 86400
	});
}

export async function createUsuario(req: Request, res: Response) {

	try {

		const conn = await connect();
		const usuario: Usuario = req.body;
		if (!usuario.contrasenha || !usuario.username) {
			return res.status(400).json({
				message: 'Por favor ingrese su nombre de usuario y contrasenha.'
			});
		}

		// encrypting contrasenha
		const salt = await bcrypt.genSalt(10);
		const hash = await bcrypt.hash(usuario.contrasenha, salt);
		usuario.contrasenha = hash;
		// generate uuid
		usuario.uuid = uuid();

		const finUsername = await conn.query('select username from usuario where username = ?', [usuario.username]);

		if (finUsername[0].length) {
			return res.json({
				message: 'El nombre de usuario ya esta en uso.',
			});
		} else {
			await conn.query('INSERT INTO usuario SET ?', [usuario]);
			return res.json({
				message: 'Usuario creado correctamente.',
				data: usuario
			});
		}
		// const compare = await bcrypt.compare(
		// 	usuario.contrasenha,
		// 	'$2b$10$g81WXZNIlPb6xSHBjcYmvukRKM7LEcuSGkjpfcMLnbdtu3UgJGpbK');
	} catch (error) {
		return res.json({
			message: error

		});
	}




	// const query = await conn.query('');
}

export async function login(req: Request, res: Response, next: any) {

	return res.send('login');

}