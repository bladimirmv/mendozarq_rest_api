import { Router } from 'express';

import * as cp from '../../controllers/liraki/opinion.producto.controller';
import { checkJwt } from '../../middlewares/jwt';
import { checkRole } from '../../middlewares/roles';

const router = Router();

router
	.route('/')

	.post([checkJwt, checkRole(['administrador', 'cliente', 'vendedor', 'arquitecto'])], cp.addOpinionProducto);

router
	.route('/:uuid')
	.get(cp.getAllOpinionProductoByUuid)
	.delete([checkJwt, checkRole(['administrador'])], cp.deleteOpinionProducto);

export default router;


