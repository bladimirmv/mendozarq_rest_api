import { Router } from 'express';

import * as personal from './../../controllers/mendozarq/personal.controller'
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';


const router: Router = Router();
// ====================> route Personal /
router.route('/')
	.get(
		[checkJwt, checkRole(['administrador'])],
		personal.getAllPersonal
	)
	.post(
		[checkJwt, checkRole(['administrador'])],
		personal.addPersonal
	);

// ====================> route Personal /:id
router.route('/:id')
	.get(
		[checkJwt, checkRole(['administrador'])],
		personal.getOnePersonal
	)
	.put(
		[checkJwt, checkRole(['administrador'])],
		personal.updatePersonal
	)
	.delete(
		[checkJwt, checkRole(['administrador'])],
		personal.deletePersonal
	);

export default router;