"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.updatePost = exports.deletePost = exports.getPost = exports.createPost = exports.getBucket = exports.getPosts = void 0;
const database_1 = require("./../database");
const aws_sdk_1 = __importDefault(require("aws-sdk"));
const config_1 = __importDefault(require("./../config/config"));
const multer_1 = __importDefault(require("multer"));
const upload = multer_1.default({ dest: 'uploads/' });
const s3 = new aws_sdk_1.default.S3(config_1.default.s3options);
function getPosts(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const posts = yield conn.query('select  * from posts;');
            return res.json(posts[0]);
        }
        catch (error) {
            return error;
        }
    });
}
exports.getPosts = getPosts;
function getBucket(req, res, next) {
    return __awaiter(this, void 0, void 0, function* () {
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
    });
}
exports.getBucket = getBucket;
function createPost(req, res, next) {
    return __awaiter(this, void 0, void 0, function* () {
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
    });
}
exports.createPost = createPost;
function getPost(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        const post = yield conn.query('select  * from posts where id = ?', [id]);
        return res.json(post[0]);
    });
}
exports.getPost = getPost;
function deletePost(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        yield conn.query('DELETE from posts where id = ?', [id]);
        return res.json({
            message: 'post deleted'
        });
    });
}
exports.deletePost = deletePost;
function updatePost(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.id;
        const conn = yield database_1.connect();
        const data = req.body;
        yield conn.query('update posts set ? where id = ?', [data, id]);
        return res.json({
            message: 'post updated'
        });
    });
}
exports.updatePost = updatePost;
