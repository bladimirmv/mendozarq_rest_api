import e, { Router } from 'express';

import { checkRole } from './../../middlewares/roles';
import * as cp from './../../controllers/liraki/carrito.producto.controller';
import { checkJwt } from './../../middlewares/jwt';

const router: Router = Router();
// ====================> route Personal /
router.route('/').post(checkJwt, cp.addCarritoProducto);

// ====================> route Personal /:id
router.route('/:uuid').get(cp.getCarritoProducto).put(cp.updateCarritoProducto).delete(cp.deleteCarritoProducto);

router.route('/producto/:uuid').delete(cp.deleteProductoFromCarrito);

export default router;
