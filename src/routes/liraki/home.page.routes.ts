import { Router } from 'express';
import multer from 'multer';
import * as hp from './../../controllers/liraki/home.page.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const upload = multer().any();

const router = Router();

router.route('/').get(hp.getHomePage);
router.route('/recienAgregados').get(hp.getRecienAgregados);

export default router;
