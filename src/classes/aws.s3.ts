import aws from 'aws-sdk';
import { Response, Request, Router } from 'express';
import { v4 as uuid } from 'uuid';
import { ManagedUpload } from 'aws-sdk/clients/s3';

import { s3ClientConfiguration } from './../classes/aws.s3.config'
import { AWS_S3 } from './../global/enviroment';
import { FileResponse } from './../models/fileResponse.interface'
import { reject, resolve } from 'bluebird';

const s3 = new aws.S3(s3ClientConfiguration);


// ====================> uploadOneFile
export const uploadOneFile = (file: Express.Multer.File, fileRef?: string): Promise<FileResponse> => {

	return new Promise<FileResponse>((resolve, reject) => {

		const originalName = file.originalname;
		const myFile = file.originalname.split('.');
		const fileType = myFile[myFile.length - 1];
		const newName = `${uuid()}.${fileType}`;

		const params: aws.S3.PutObjectRequest = {
			Bucket: AWS_S3.Bucket + String(fileRef),
			Key: newName,
			Body: file.buffer
		};

		s3.upload(params, (error: Error, data: ManagedUpload.SendData) => {
			return error
				? reject(error)
				: resolve({ originalName, newName, data });
		});
	});


}

// ====================> uploadMoreThanOneFile
export const uploadFiles = (files: Express.Multer.File[], fileRef?: string): Promise<FileResponse[]> => {
	return Promise.all(files.map((file: Express.Multer.File) => {
		return uploadOneFile(file, fileRef);
	}));
}

// ====================> listFiles
export const listFiles = (fileRef?: string): Promise<any[]> => {
	const params = {
		Bucket: AWS_S3.Bucket + fileRef
	};

	const keys: any[] = [];

	return new Promise((resolve, reject) => {

		s3.listObjectsV2(params, (error: Error, data) => {
			if (error) {
				return reject(error);
			} else {
				const contents = data.Contents || [];
				contents.forEach((content) => {
					keys.push(content.Key);
				});

				return resolve(keys);
			}
		});
	});
}


// ====================> dowloadFile
export const downloadFile = async (req: Request, res: Response) => {

	console.log('parms', req.params);

	const params = {
		Bucket: AWS_S3.Bucket,
		Key: req.params.key
	};

	res.setHeader('Content-Disposition', 'attachment');

	s3.getObject(params)
		.createReadStream()
		.on('error', error => {
			return res.status(500).json({
				message: 'Ocurrio un error al descargar el archivo',
				error
			});
		}).pipe(res);
}


// ====================> deleteFile
export const deleteFile = (keyName: string) => {
	return new Promise<aws.S3.DeleteObjectOutput>((resolve, reject) => {
		const params: aws.S3.PutObjectRequest = {
			Bucket: AWS_S3.Bucket,
			Key: keyName
		};
		s3.deleteObject(params, (error: aws.AWSError, data: aws.S3.DeleteObjectOutput) => {
			return error
				? reject(error)
				: resolve(data);
		});
	});
}


