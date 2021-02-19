import { Request, Response } from 'express';
import { v4 as uuid } from 'uuid';
import { FieldPacket, Pool } from 'mysql2/promise';

import { CarpetaProyecto, DocumentoCarpeta, DocumentoProyCarpeta, DocumentoProyecto, Path } from '../../models/mendozarq/documentos.proyecto.interface';
import { connect } from './../../classes/database';
import { FileResponse } from '../../models/fileResponse.interface';
import { uploadOneFile, deleteFile } from './../../classes/aws.s3';
import e from 'cors';

// ====================> addCarpetaProyecto
export const addCarpetaProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const carpeta: CarpetaProyecto = req.body;
		console.log(carpeta);

		if (!carpeta.nombre) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese los datos de la carpeta. 🙁'
			});
		}

		const [[existCarpeta]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM carpetaProyecto WHERE  nombre = ? and uuidProyecto = ?', [carpeta.nombre, carpeta.uuidProyecto]);

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

		const [[existNombre]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM carpetaProyecto WHERE  nombre = ? AND uuid != ? AND uuidProyecto = ?', [carpeta.nombre, uuid, existCarpeta.uuidProyecto]);
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
			message: error
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

// ************************************ Documentos ****************************************************

// ====================> addDocumentoProyecto
export const addDocumentoProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const documento: DocumentoProyecto = JSON.parse(req.body.documento);
		const files: Array<Express.Multer.File> | any = req.files;
		const file: Express.Multer.File = files[0];
		let fileUploaded: FileResponse;

		if (!file) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese un documento documento. 🙁'
			});
		}


		fileUploaded = await uploadOneFile(file, '/mendozarq/documents');
		documento.keyName = fileUploaded.data.Key;
		documento.location = fileUploaded.data.Location;
		documento.nombre = fileUploaded.originalName;

		documento.uuid = uuid();


		await conn.query('INSERT INTO documentoProyecto SET ? ', documento);


		return res.status(201).json({
			message: 'Documento creado exitosamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getAllDocumentoProyectoByUuid
export const getAllDocumentoProyectoByUuid = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		const path: Path = req.params.path as Path;
		console.log(path);


		const [documentos]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM documentoProyecto WHERE uuidProyecto = ? AND path = ? ORDER BY creadoEn DESC', [uuid, path]);


		return res.status(200).json(documentos);
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> deleteDocumento
export const deleteDocumento = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;

		const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM documentoProyecto WHERE uuid = ? ', [uuid]);
		const documento: DocumentoProyecto = row as DocumentoProyecto;

		if (!documento) {
			return res.status(404).json({
				message: 'No se puede eliminar por que el documento no existe. 🙁'
			})
		}

		const deletedData = await deleteFile(documento.keyName);

		if (documento.path === 'folder') {
			await conn.query('DELETE FROM documentoCarpeta WHERE uuidDocumento = ?', [documento.uuid]);
		}

		await conn.query('DELETE FROM documentoProyecto WHERE uuid = ?', [uuid]);


		return res.status(200).json({
			message: 'Documento eliminado correctamento. 😀',
			deletedData
		})


	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> updateDocumentoProyecto
export const updateDocumentoProyecto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const documento: DocumentoProyecto = req.body;
		const uuid: string = req.params.uuid;


		const [[existDoc]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM documentoProyecto WHERE uuid = ?', [uuid]);
		if (!existDoc) {
			return res.status(404).json({
				message: 'No se pudo actualizar el documento, por que no existe. 🙁'
			});
		}

		console.table([documento.nombre, uuid, existDoc.path, existDoc.uuidProyecto]);


		const [[existNombre]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM documentoProyecto WHERE  nombre = ? AND uuid != ? AND path = ? AND uuidProyecto = ?', [documento.nombre, uuid, existDoc.path, existDoc.uuidProyecto]);
		if (existNombre) {
			return res.status(404).json({
				message: 'Ya existe un documento con el mismo nombre, por favor ingrese otro en su lugar. 🙁'
			});
		}

		await conn.query('UPDATE documentoProyecto SET ? WHERE uuid = ?', [documento, uuid]);
		return res.status(200).json({
			message: 'Documento actualizado correctamente! 😀'
		});

	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}


// ************************************ DocumentoCarpeta ****************************************************

// ====================> addDocumentoCarpeta
export const addDocumentoCarpeta = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const documento: DocumentoProyCarpeta = JSON.parse(req.body.documento);
		const uuidCarpeta = documento.uuidCarpeta;
		const files: Array<Express.Multer.File> | any = req.files;
		const file: Express.Multer.File = files[0];
		let fileUploaded: FileResponse;

		if (!file) {
			return res.status(400).json({
				message: 'No se ha podido registrar, por favor ingrese un documento documento. 🙁'
			});
		}


		fileUploaded = await uploadOneFile(file, '/mendozarq/documents');
		documento.uuid = uuid();
		documento.keyName = fileUploaded.data.Key;
		documento.location = fileUploaded.data.Location;
		documento.nombre = fileUploaded.originalName;


		delete documento.uuidCarpeta;
		console.log(documento);

		await conn.query('INSERT INTO documentoProyecto SET ? ', documento);

		const documentoCarpeta: DocumentoCarpeta = {
			uuid: uuid(),
			uuidCarpeta: String(uuidCarpeta),
			uuidDocumento: documento.uuid
		};
		console.log(documentoCarpeta);

		await conn.query('INSERT INTO documentoCarpeta SET ? ', documentoCarpeta);

		return res.status(201).json({
			message: 'Documento creado exitosamente! 😀'
		});
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}

// ====================> getAllDocumentoCarpetaByUuid
export const getAllDocumentoCarpetaByUuid = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const uuid: string = req.params.uuid;
		const path: Path = req.params.path as Path;
		console.log(path);


		const [documentos]: [any[], FieldPacket[]] = await conn.query(`
					SELECT dp.*
					FROM documentoCarpeta AS dc
									INNER JOIN documentoProyecto AS dp ON dc.uuidDocumento = dp.uuid
									INNER JOIN carpetaProyecto cp on dc.uuidCarpeta = cp.uuid
					WHERE cp.uuid = ? AND dp.path = ?
					ORDER BY creadoEn DESC;`, [uuid, path]);

		return res.status(200).json(documentos);
	} catch (error) {
		console.log('❌Ocurrio un error:', error);
		return res.status(400).json({
			message: error
		});
	}
}