import { Router } from 'express';
import * as v from './../../controllers/liraki/venta.producto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router = Router();

router.route('/:uuid').delete([checkJwt, checkRole(['administrador'])], v.deleteVenta);

router
  .route('/fisica/')
  .get([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], v.getAllVentaFisica)
  .post([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], v.addVentaFisica);

router
  .route('/fisica/:uuid')
  .put([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], v.updateVenta);

router
  .route('/estado/:uuid')
  .put([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], v.updateEstadoVenta);

router
  .route('/online/')
  .post([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], v.addVentaOnline);
export default router;
