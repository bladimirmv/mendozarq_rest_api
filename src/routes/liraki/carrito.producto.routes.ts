import e, { Router } from 'express';

import { checkRole } from './../../middlewares/roles';
import * as cp from './../../controllers/liraki/carrito.producto.controller';
import { checkJwt } from './../../middlewares/jwt';

const router: Router = Router();
// ====================> route Personal /
router.route('/').post([checkJwt, checkRole(['administrador'])], cp.addCarritoProducto);

// ====================> route Personal /:id
router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador'])], cp.getCarritoProducto)
  .put([checkJwt, checkRole(['administrador'])], cp.updateCarritoProducto)
  .delete([checkJwt, checkRole(['administrador'])], cp.deleteCarritoProducto);

export default router;
