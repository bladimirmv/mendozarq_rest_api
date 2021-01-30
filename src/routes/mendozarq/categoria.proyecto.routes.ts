import { Router } from 'express';

import * as cp from '../../controllers/mendozarq/categoria.proyecto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		[checkJwt, checkRole(['administrador'])],
		cp.getAllCategoriaProyecto
	)
	.post(
		[checkJwt, checkRole(['administrador'])],
		cp.addCategoriaProyecto
	);

router.route('/:uuid')
	.get(
		[checkJwt, checkRole(['administrador'])],
		cp.getOneCategoriaProyecto
	)
	.put(
		[checkJwt, checkRole(['administrador'])],
		cp.updateCategoriaProyecto
	)
	.delete(
		[checkJwt, checkRole(['administrador'])],
		cp.deleteCategoriaProyecto
	);

export default router;