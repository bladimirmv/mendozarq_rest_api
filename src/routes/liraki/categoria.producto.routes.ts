import { Router } from 'express';

import * as cp from './../../controllers/liraki/categoria.producto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router = Router();

router.route('/')
	.get([checkJwt, checkRole(['administrador', 'vendedor'])],
		cp.getAllcategoriaProducto
	)
	.post(
		[checkJwt, checkRole(['administrador'])],
		cp.addCategoriaProducto
	);

router.route('/:uuid')
	.get(
		[checkJwt, checkRole(['administrador'])],
		cp.getOneCategoriaProducto
	)
	.put(
		[checkJwt, checkRole(['administrador'])],
		cp.updatecategoriaProducto
	)
	.delete(
		[checkJwt, checkRole(['administrador'])],
		cp.deletecategoriaProducto
	);

export default router;