import { connect } from './../../classes/database';
import { Request, Response } from 'express';
import { CarpetaProyecto, DocumentoProyecto } from '../../models/mendozarq/documentos.proyecto.interface';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';
import { uploadOneFile } from './../../classes/aws.s3';
import { FileResponse } from '../../models/fileResponse.interface';

// ====================> addCarpetaProyecto
export const addCarpetaProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const carpeta: CarpetaProyecto = req.body;

		if (!carpeta.nombre) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese los datos de la carpeta. 🙁'
			});
		}

		const [[existCarpeta]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM carpetaProyecto WHERE  nombre = ? and uuidProyecto != ?', [carpeta.nombre, carpeta.uuidProyecto]);

		if (existCarpeta) {
			return res.status(400).json({
				message: 'Ya existe una carpeta con el mismo nombre, por favor ingrese otro en su lugar. 🙁'
			});
		}

		carpeta.uuid = uuid();

		await conn.query('INSERT INTO carpetaProyecto SET ? ', carpeta);

		return res.status(201).json({
			message: 'Carpeta creado exitosamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getOneCarpetaProyecto
export const getOneCarpetaProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[carpeta]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM carpetaProyecto WHERE uuid = ?', [uuid]);

		if (carpeta) {
			return res.status(200).json(carpeta);
		}

		return res.status(404).json({
			message: 'No se encontro la carpeta. 🙁'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getAllCarpetaProyecto
export const getAllCarpetaProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();

		const [carpetas]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM carpetaProyecto ORDER BY creadoEn DESC');

		return res.status(200).json(carpetas);
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getAllCarpetaProyectoByUuid
export const getAllCarpetaProyectoByUuid = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		console.log('this uuid', uuid);


		const [carpetas]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM carpetaProyecto WHERE uuidProyecto = ? ORDER BY creadoEn DESC', [uuid]);


		return res.status(200).json(carpetas);
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> updateCarpetaProyecto
export const updateCarpetaProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const carpeta: CarpetaProyecto = req.body;
		const uuid: string = req.params.uuid;


		const [[existCarpeta]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM carpetaProyecto WHERE uuid = ?', [uuid]);
		if (!existCarpeta) {
			return res.status(404).json({
				message: 'No se pudo actualizar la carpeta, por que no existe. 🙁'
			});
		}

		const [[existNombre]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM carpetaProyecto WHERE  nombre = ? and uuid != ?', [carpeta.nombre, uuid]);
		if (existNombre) {
			return res.status(404).json({
				message: 'Ya existe una carpeta con el mismo nombre, por favor ingrese otro en su lugar. 🙁'
			});
		}

		await conn.query('UPDATE carpetaProyecto SET ? WHERE uuid = ?', [carpeta, uuid]);
		return res.status(200).json({
			message: 'Carpeta actualizado correctamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: 'Lo sentimos ocurrio un problema al guardar el personal. 🙁',
			error
		});
	}
}

// ====================> deleteCarpetaProyecto
export const deleteCarpetaProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;


		const [[existCarpeta]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM carpetaProyecto WHERE uuid = ?', [uuid]);
		if (!existCarpeta) {
			return res.status(404).json({
				message: 'No se pudo eliminar la carpeta, por que no existe. 🙁'
			});
		}

		await conn.query('DELETE FROM carpetaProyecto WHERE uuid = ?', [uuid]);
		return res.status(200).json({
			message: 'Carpeta eliminado correctamente. 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}



// ====================> addDocumentoProyecto
export const addDocumentoProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const documento: DocumentoProyecto = JSON.parse(req.body.documento);
		const files: Array<Express.Multer.File> | any = req.files;
		const file: Express.Multer.File = files[0];
		let fileUploaded: FileResponse;

		console.log(documento);


		if (!documento.nombre) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese el nombre del documento. 🙁'
			});
		}

		if (!file) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese el documento. 🙁'
			});
		}
		const [[existDocumento]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM documentoProyecto WHERE nombre = ? and uuidProyecto', [documento.nombre, documento.uuidProyecto]);

		if (existDocumento) {
			return res.status(400).json({
				message: 'Ya existe un documento con ese nombre, por favor ingrese otro en su lugar. 🙁'
			});
		}

		fileUploaded = await uploadOneFile(file, '/mendozarq/documents');
		documento.keyName = fileUploaded.data.Key;
		documento.location = fileUploaded.data.Location;

		documento.uuid = uuid();

		await conn.query('INSERT INTO documentoProyecto SET ? ', documento);

		return res.status(201).json({
			message: 'Carpeta creado exitosamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}