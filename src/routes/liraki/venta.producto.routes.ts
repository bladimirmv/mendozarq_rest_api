import { Router } from 'express';
import * as v from './../../controllers/liraki/venta.producto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router = Router();

router
  .route('/fisica/')
  .get([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], v.getAllVentaFisica);

export default router;
