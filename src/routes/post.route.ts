import { Router } from "express";
import multer from 'multer';

import { getPosts, createPost, getPost, deletePost, updatePost } from "./../controllers/post.controller";

const router = Router();


// const storage = multer.diskStorage({
// 	destination: (req, file, callback) => {
// 		callback(null, )
// 	}
// })

const upload = multer().single('file');

router.route('/')
	.get(getPosts)
	.post(upload, createPost);


router.route('/:id')
	.get(getPost)
	.delete(deletePost)
	.put(updatePost);

export default router;