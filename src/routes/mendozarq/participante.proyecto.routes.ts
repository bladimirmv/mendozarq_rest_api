import { Router } from 'express';
import multer from 'multer';

import * as pp from '../../controllers/mendozarq/participante.proyecto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const upload = multer().any();

const router = Router();

router.route('/personal')

	.post(
		[checkJwt, checkRole(['administrador'])],
		pp.addPersonalProyecto
	);

router.route('/personal/:uuid')
	.get(
		[checkJwt, checkRole(['administrador'])],
		pp.getAllPersonalProyecto
	)
	.delete(
		[checkJwt, checkRole(['administrador'])],
		pp.deletePersonalProyecto
	);

router.route('/personal/proyecto/:uuid')
	.get(
		[checkJwt, checkRole(['administrador'])],
		pp.getAllPersonalByUuid
	)


export default router;