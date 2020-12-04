"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const multer_1 = __importDefault(require("multer"));
const post_controller_1 = require("./../controllers/post.controller");
const router = express_1.Router();
// const storage = multer.diskStorage({
// 	destination: (req, file, callback) => {
// 		callback(null, )
// 	}
// })
const upload = multer_1.default().single('file');
router.route('/')
    .get(post_controller_1.getPosts)
    .post(upload, post_controller_1.createPost);
router.route('/:id')
    .get(post_controller_1.getPost)
    .delete(post_controller_1.deletePost)
    .put(post_controller_1.updatePost);
exports.default = router;
