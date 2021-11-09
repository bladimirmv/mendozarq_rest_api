import { FieldPacket, Pool, RowDataPacket } from 'mysql2/promise';
import { Request, Response } from "express";
import { connect } from '../../classes/database';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken'

import config from '../../config/config'
import { Usuario } from "../../models/auth/usuario.interface";
import { Credenciales } from "./../../models/auth/credenciales.interface";

// ===============================================================================
export function createToken(usuario: Usuario) {
	return jwt.sign({ uuid: usuario.uuid, username: usuario.username, rol: usuario.rol, nombre: usuario.nombre }, config.jwtSecret, {
		expiresIn: '8h'
	});
}
// ===============================================================================
export async function login(req: Request, res: Response, next: any) {
	try {
		// *creating pool
		let conn: Pool | undefined = await connect();
		const credenciales: Credenciales = req.body;

		// *checking credenciales
		if (!credenciales.contrasenha || !credenciales.username) {
			return res.status(400).json({
				message: 'Por favor ingrese su nombre de usuario y contrasenha. ❌',
				data: credenciales
			});
		}

		// *finding usuario
		const [[findUsername]]: [any[], FieldPacket[]] = await conn.query('select * from usuario where username = ?', [credenciales.username]);
		// conn.end();
		const usuario: Usuario = findUsername as Usuario;

		// *checking if exist usuario
		if (!usuario) {
			return res.status(400).json({
				message: `El usuario \'${credenciales.username}\' no existe. 🙁`,
			});
		}

		// *checking if usuario is active
		if (!usuario.activo) {
			return res.status(400).json({
				message: `La cuenta \'${credenciales.username}\' esta suspendida. 🙁`,
			});
		}

		// *comparing contrasenha
		const isMatch = await bcrypt.compare(credenciales.contrasenha, usuario.contrasenha as string);
		// *cheking match
		if (isMatch) {
			// const { nombre, apellidoPaterno, apellidoMaterno, rol }: Usuario = usuario;
			return res.status(200).json({
				message: `Bienvenido ${usuario.nombre}! 👋`,
				token: createToken(usuario),
				body: usuario
			});
		}
		// *return error
		return res.status(400).json({
			message: "El correo o la contraseña son incorrectas. ❌"
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}