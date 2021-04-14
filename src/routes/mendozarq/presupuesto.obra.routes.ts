import { Router } from 'express';

import * as po from './../../controllers/mendozarq/presupuesto.obra.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';


const router: Router = Router();
// ====================> /
router.route('/')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		po.getAllPresupuestoObra
	)
	.post(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		po.addPresupuestoObra
	);

// ====================> /:id
router.route('/:uuid')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		po.getOnePresupuestoObra
	)
	.put(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		po.updatePresupuestoObra
	)
	.delete(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		po.deletePresupuestoObra
	);

export default router;


