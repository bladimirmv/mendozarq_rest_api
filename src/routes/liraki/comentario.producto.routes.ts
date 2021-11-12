import { Router } from 'express';

import * as cp from '../../controllers/liraki/comentario.producto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router = Router();

router
	.route('/')
	.get(
		[checkJwt, checkRole(['administrador', 'vendedor'])],
		cp.getAllComentarioProducto
	)
	.post([checkJwt, checkRole(['administrador', 'cliente', 'vendedor', 'arquitecto'])], cp.addComentarioProducto);

router
	.route('/:uuid')
	.delete([checkJwt, checkRole(['administrador'])], cp.deleteComentarioProducto);

export default router;


