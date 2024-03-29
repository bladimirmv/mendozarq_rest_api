import { Router } from 'express';
import multer from 'multer';

import * as h from './../../controllers/mendozarq/herramienta.controller'
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const upload = multer().any();

const router: Router = Router();
// ====================> route Herramienta /
router.route('/')
	.get(
		[checkJwt, checkRole(['administrador'])],
		h.getAllHerramienta
	)
	.post(
		upload,
		[checkJwt, checkRole(['administrador'])],
		h.addHerramienta
	);

// ====================> route Herramienta /:id
router.route('/:uuid')
	.get(
		[checkJwt, checkRole(['administrador'])],
		h.getOneHerramienta)
	.put(
		[checkJwt, checkRole(['administrador'])],
		h.updateHerramienta
	)
	.delete(
		[checkJwt, checkRole(['administrador'])],
		h.deleteHerramienta
	);

export default router;
