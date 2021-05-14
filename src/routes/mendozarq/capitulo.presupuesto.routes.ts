import { Router } from 'express';

import * as cp from '../../controllers/mendozarq/capitulo.presupuesto.controller';
import { checkJwt } from '../../middlewares/jwt';
import { checkRole } from '../../middlewares/roles';


const router: Router = Router();
// ====================> /
router.route('/')
	.post(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		cp.addCapituloPresupuesto
	);

// ====================> /:id
router.route('/:uuid')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		cp.getAllCapituloPresupuesto
	)
	.put(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		cp.updateCapituloPresupuesto
	)
	.delete(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		cp.deleteCapituloPresupuesto
	);

export default router;

