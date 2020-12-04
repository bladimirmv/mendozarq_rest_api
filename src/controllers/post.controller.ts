import { post } from './../models/post.interface';

import { Request, Response } from "express";
import { connect } from "./../database";

import aws from 'aws-sdk';

import config from './../config/config';
import { v4 as uuidv4 } from 'uuid';
import multer from 'multer';
const upload = multer({ dest: 'uploads/' });





const s3 = new aws.S3(config.s3options);

export async function getPosts(req: Request, res: any) {
	try {

		const conn = await connect();
		const posts = await conn.query('select  * from posts;');
		return res.json(posts[0]);

	} catch (error) {
		return error;
	}


}

export async function getBucket(req: Request, res: Response, next: any) {
	// s3.listBuckets((err, data) => {
	// 	if (err) throw err;
	// 	console.log(data);

	// });

	// const params = {
	// 	Bucket: 'mendozarq'
	// }
	// s3.listObjectsV2(params, (err, data) => {
	// 	if (err) throw err;
	// 	console.log(data);

	// });



	// s3.getObject({
	// 	Bucket: 'mendozarq',
	// 	Key: '020e728c563c0d6bbaea5dcdf85c5e3e.jpg'
	// }, (err, data) => {
	// 	if (err) throw err;
	// 	console.log(data);
	// 	fs.writeFile('img.jpg', data.Body, 'binary', (err) => {
	// 		if (err) throw err;
	// 		console.log('img grabada al disco');

	// 	})
	// });



	// s3.upload({
	// 	Bucket: 'mendozarq',
	// 	Key: 'img.jpg',
	// 	Body: req.body
	// })
	console.log('hola?');

	// console.log('llega', req.file.size);


}




export async function createPost(req: Request, res: Response, next: any) {
	// s3.upload({
	// 	Bucket: 'mendozarq',
	// 	Key: req.file.originalname,
	// 	// Body: req.file.mimetype
	// }, (err, data) => {
	// 	if (err) throw err;
	// 	console.log(data);
	// });




	// console.log('file:', req.file);
	// console.log('body:', req.body);


	let myFile = req.file.originalname.split('.');
	const fileType = myFile[myFile.length - 1];




	s3.upload({
		Bucket: 'mendozarq',
		Key: req.file.originalname,

		Body: req.file.buffer
	}, (err, data) => {
		if (err) {
			return res.status(500).send(err);
		}
		return res.status(200).send(data);
	}).
		on('httpUploadProgress', function (evt) {
			console.log('progressssssssssss:', evt);
			//Emit Here your events 
		});


}

export async function getPost(req: Request, res: Response): Promise<Response> {

	const id = req.params.id;
	const conn = await connect();

	const post = await conn.query('select  * from posts where id = ?', [id]);

	return res.json(post[0]);

}

export async function deletePost(req: Request, res: Response) {

	const id = req.params.id;
	const conn = await connect();

	await conn.query('DELETE from posts where id = ?', [id]);
	return res.json({
		message: 'post deleted'
	});
}

export async function updatePost(req: Request, res: Response) {

	const id = req.params.id;
	const conn = await connect();
	const data: post = req.body;
	await conn.query('update posts set ? where id = ?', [data, id]);
	return res.json({
		message: 'post updated'
	});
}