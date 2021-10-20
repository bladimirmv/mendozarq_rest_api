import { Router } from 'express';

import * as p from './../../controllers/liraki/producto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router = Router();

router
	.route('/')
	.get(
		[checkJwt, checkRole(['administrador', 'vendedor'])],
		p.getAllProducto
	)
	.post([checkJwt, checkRole(['administrador'])], p.addProducto);

router
	.route('/:uuid')
	.get([checkJwt, checkRole(['administrador'])], p.getOneProducto)
	.put([checkJwt, checkRole(['administrador'])], p.updateProducto)
	.delete([checkJwt, checkRole(['administrador'])], p.deleteProducto);

export default router;
