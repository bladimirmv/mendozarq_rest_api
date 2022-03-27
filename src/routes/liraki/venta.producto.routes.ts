import { Router } from 'express';
import * as v from './../../controllers/liraki/venta.producto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router = Router();

router
  .route('/fisica/')
  .get([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], v.getAllVentaFisica)
  .post([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], v.addVentaFisica);

router
  .route('/fisica/:uuid')
  .put([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], v.updateVenta);
export default router;
