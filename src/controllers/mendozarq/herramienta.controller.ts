import { Request, Response } from 'express';
import { Pool, FieldPacket } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';
import { ManagedUpload } from 'aws-sdk/clients/s3';


import { connect } from './../../classes/database';
import { Herramienta } from './../../models/mendozarq/herramienta.interface';
import { FileResponse } from './../../models/fileResponse.interface';
import * as awsS3 from './../../classes/aws.s3';


// ====================> addHerramienta
export const addHerramienta = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const herramienta: Herramienta = req.body;

		let img: FileResponse;
		const files: Array<Express.Multer.File> | any = req.files;
		const file: Express.Multer.File = files[0];
		const fileRef = '/mendozarq/images';

		if (!herramienta.nombre) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese los datos de la herramienta'
			});
		}

		if (file) {
			try {
				img = await awsS3.uploadOneFile(file, fileRef);

				herramienta.urlImg = img.data.Location;
				herramienta.keyImg = img.newName;
				herramienta.originalNameImg = file.originalname;
			} catch (error) {
				return res.status(500).json({
					message: `Lo sentimos ocurrio un problema al guardar la imagen de la herramienta. 🙁`,
					error
				});
			}

		}

		herramienta.uuid = uuid();

		await conn.query('INSERT INTO herramienta SET ?', [herramienta]);

		return res.status(200).json({
			message: 'Herramienta creado correctamente! 😀'
		});

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: `Lo sentimos ocurrio un problema al guardar la herramienta. 🙁`,
			error
		});
	}
}

// ====================> getOneHerramienta
export const getOneHerramienta = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[personal]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM herramienta WHERE uuid = ?', [uuid]);

		return personal
			? res.status(200).json(personal)
			: res.status(404).json({
				message: 'No se encontro la herramienta. 🙁'
			});

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: `Lo sentimos ocurrio un problema al recuperar la herramienta. 🙁`,
			error
		});
	}
}

// ====================> getAllHerramienta
export const getAllHerramienta = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();

		const [herramientas]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM herramienta ORDER BY creadoEn DESC');

		return res.status(200).json(herramientas);

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: `Lo sentimos ocurrio un problema al recuperar las herramientas. 🙁`,
			error
		});
	}
}

// ====================> updateHerramienta
export const updateHerramienta = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		const herramienta: Herramienta = req.body;

		const [[herramientaFound]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM herramienta WHERE uuid = ?', [uuid]);

		if (herramientaFound) {
			await conn.query('UPDATE herramienta SET ? WHERE uuid = ?', [herramienta, uuid]);

			res.status(200).json({
				message: 'Herramienta actulizado correctamente! 😀'
			});

		} else {
			res.status(400).json({
				message: 'No se pudo actulizar la herramienta, por que no existe. 🙁'
			})
		}

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: `Lo sentimos ocurrio un problema al actualizar la herramienta. 🙁`,
			error
		});
	}
}

// ====================> deleteHerramienta
export const deleteHerramienta = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;


		const [[herramientaFound]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM herramienta WHERE uuid = ?', [uuid]);

		if (herramientaFound) {
			await conn.query('DELETE FROM herramienta WHERE uuid = ?', [uuid]);
			res.status(200).json({
				message: 'Herramienta eliminado correctamente! 😀'
			});
		} else {
			res.status(400).json({
				message: 'No se pudo eliminar la herramienta, por que no existe. 🙁'
			})
		}

	} catch (error) {
		console.log('❌ Ocurrio un error: ', error);
		return res.status(400).json({
			message: `Lo sentimos ocurrio un problema al eliminar la herramienta. 🙁`,
			error
		});
	}
}


