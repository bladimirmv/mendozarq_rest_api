import { Router } from 'express';

import * as pp from './../../controllers/liraki/pagos.paypal.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router = Router();

router
  .route('/create-order')
  .post(pp.createOrder)


router
  .route('/capture-order')
  .get(pp.captureOrder)

router
  .route('/cancel-order')
  .get(pp.cancelOrder)

export default router;
