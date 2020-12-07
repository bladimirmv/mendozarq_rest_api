import { Request, Response } from "express";
import { connect } from './../database';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken'
import { v4 as uuid } from 'uuid';


import config from './../config/config'
import { Usuario } from "./../models/usuario.interface";
import { Credenciales } from "./../models/credenciales.interface";


function createToken(usuario: Usuario) {
	return jwt.sign({ uuid: usuario.uuid, username: usuario.username }, config.jwtSecret, {
		expiresIn: 86400
	});
}

export async function createUsuario(req: Request, res: Response) {
	try {
		const conn = await connect();
		const usuario: Usuario = req.body;
		if (!usuario.contrasenha || !usuario.username || !usuario.rol) {
			return res.status(400).json({
				message: 'Por favor ingrese los campos requeridos.',
				data: usuario
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
			});
		} else {
			await conn.query('INSERT INTO usuario SET ?', [usuario]);
			return res.status(201).json({
				message: 'Usuario creado correctamente.',
				data: usuario
			});
		}
	} catch (error) {
		return res.status(400).json({
			message: error
		});
	}
}

export async function login(req: Request, res: Response, next: any) {
	// res.send('hola');

	try {
		const conn = await connect();
		const credenciales: Credenciales = req.body;
		if (!credenciales.contrasenha || !credenciales.username) {
			return res.status(400).json({
				message: 'Por favor ingrese su nombre de usuario y contrasenha.',
				data: credenciales
			});
		}


		let findUsername = await conn.query('select * from usuario where username = ?', [credenciales.username]);
		const usuario: Usuario[] = findUsername[0] as Usuario[];

		if (!findUsername[0].length) {
			return res.status(400).json({
				message: 'El usuario no existe.',
			});
		}

		// comparing contrasenha
		const isMatch = await bcrypt.compare(credenciales.contrasenha, usuario[0].contrasenha as string);
		if (isMatch) {
			delete usuario[0].contrasenha;
			delete usuario[0].generarCredenciales;
			return res.status(200).json({
				message: 'Inicio de sesion correcto.',
				token: createToken(usuario[0]),
				body: usuario[0]
			});
		}

		return res.status(400).json({
			message: "El correo o la contraseña son incorrectas"
		});

	} catch (error) {
		return res.status(400).json({
			message: error
		});
	}
}