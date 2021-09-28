import { uploadOneFile } from './../../classes/aws.s3';
import { FileResponse } from './../../models/fileResponse.interface';
import { ProductoView } from './../../models/liraki/producto.interface';
import { Pool } from 'mysql2/promise';
import { Request, Response } from 'express';
import { connect } from '../../classes/database';

export const addProducto = async (req: Request, res: Response) => {
	try {
		const conn: Pool = await connect();
		const producto: ProductoView = JSON.parse(req.body.producto);
		const files: Array<Express.Multer.File> | any = req.files;
		const file: Express.Multer.File = files[0];
		let fileUploaded: FileResponse;


		if (files) {

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
