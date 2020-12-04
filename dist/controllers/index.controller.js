"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.indexWelcome = void 0;
function indexWelcome(req, res) {
    return res.json('welcome to my fuckin api');
}
exports.indexWelcome = indexWelcome;
// import { post } from './../interfaces/post.interface';
// import { Request, Response, json } from "express";
// import { connect } from "./../database";
// import path from 'path';
// import { Observable, async, Subject } from 'rxjs';
// import { Storage, Bucket } from '@google-cloud/storage';
// import multer from 'multer';
// const upload = multer({ dest: 'uploads/' });
// export async function getPosts(req: Request, res: any) {
// 	// try {
// 	// 	const conn = await connect();
// 	// 	const posts = await conn.query('select  * from posts;');
// 	// 	return res.json(posts[0]);
// 	// } catch (error) {
// 	// 	return error;
// 	// }
// 	const subs$ = Observable.create(async (Subject: Subject<post[]>) => {
// 		const conn = await connect();
// 		const posts = await conn.query('select  * from posts;');
// 		Subject.next(res.json(posts[0]));
// 	});
// 	const subscription = subs$.subscribe();
// 	return subs$;
// }
// // export function sendUploadToGCS(req: any, res: any, next: any) {
// // 	if (!req.file) {
// // 		return next();
// // 	}
// // 	const gcsname = Date.now() + req.file.originalname;
// // 	const file = gc.bucket('mendocloud');
// // 	const stream = file.file(req.file.originalname).createWriteStream({
// // 		metadata: {
// // 			contentType: req.file.mimetype
// // 		}
// // 	});
// // 	stream.on('error', (err) => {
// // 		req.file.cloudStorageError = err;
// // 		next(err);
// // 	});
// // 	stream.on('finish', () => {
// // 		req.file.cloudStorageObject = 'mendocloud';
// // 		file.makePublic().then(() => {
// // 			req.file.cloudStoragePublicUrl = getPublicUrl('mendocloud');
// // 			next();
// // 		});
// // 	});
// // 	stream.end(req.file.buffer);
// // }
// function getPublicUrl(filename: any) {
// 	return `https://storage.googleapis.com/mendocloud/${filename}`;
// }
// export async function createPost(req: Request, res: Response, next: any) {
// 	// console.log(req.file);
// 	// console.log(JSON.stringify(req.body));
// 	const gc = new Storage({
// 		keyFilename: path.join(__dirname, './../../mendozarq-285821-2e5feec21d4d.json'),
// 		projectId: 'mendozarq-285821'
// 	});
// 	const FilesBucket = gc.bucket('mendocloud');
// 	const stream = FilesBucket.file(req.file.originalname).createWriteStream({
// 		metadata: {
// 			contentType: req.file.mimetype
// 		}
// 	});
// 	stream.on('finish', () => {
// 		FilesBucket.makePublic().then(async () => {
// 			const cloudStoragePublicUrl = getPublicUrl(`${req.file.originalname}`);
// 			console.log(cloudStoragePublicUrl);
// 			const conn = await connect();
// 			const data: post = req.body;
// 			data.image_url = cloudStoragePublicUrl;
// 			await conn.query('INSERT INTO posts SET ?', [data]);
// 			return res.json({
// 				message: 'cerated'
// 			});
// 			next();
// 		});
// 	});
// 	stream.end(req.file.buffer);
// }
// export async function getPost(req: Request, res: Response): Promise<Response> {
// 	const id = req.params.id;
// 	const conn = await connect();
// 	const post = await conn.query('select  * from posts where id = ?', [id]);
// 	return res.json(post[0]);
// }
// export async function deletePost(req: Request, res: Response) {
// 	const id = req.params.id;
// 	const conn = await connect();
// 	await conn.query('DELETE from posts where id = ?', [id]);
// 	return res.json({
// 		message: 'post deleted'
// 	});
// }
// export async function updatePost(req: Request, res: Response) {
// 	const id = req.params.id;
// 	const conn = await connect();
// 	const data: post = req.body;
// 	await conn.query('update posts set ? where id = ?', [data, id]);
// 	return res.json({
// 		message: 'post updated'
// 	});
// }
