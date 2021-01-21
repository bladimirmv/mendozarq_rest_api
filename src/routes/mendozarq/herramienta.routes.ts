import { Router } from 'express';

import * as herramienta from './../../controllers/mendozarq/herramienta.controller'
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';


const router: Router = Router();
// ====================> route Herramienta /
router.route('/')
	.get(
		// [checkJwt, checkRole(['administrador'])],
		herramienta.getAllHerramienta
	)
	.post(
		// [checkJwt, checkRole(['administrador'])],
		herramienta.addHerramienta
	);

// ====================> route Herramienta /:id
router.route('/:id')
	.get(
		// [checkJwt, checkRole(['administrador'])],
		herramienta.getOneHerramienta
	)
	.put(
		// [checkJwt, checkRole(['administrador'])],
		herramienta.updateHerramienta
	)
	.delete(
		// [checkJwt, checkRole(['administrador'])],
		herramienta.deleteHerramienta
	);

export default router;