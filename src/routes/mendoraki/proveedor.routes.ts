import { Router } from 'express';

import * as p from './../../controllers/mendoraki/proovedor.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router: Router = Router();
// ====================> route  /
router
  .route('/')
  .get([checkJwt, checkRole(['administrador'])], p.getAllProveedor)
  .post([checkJwt, checkRole(['administrador'])], p.addProveedor);

// ====================> route  /:id
router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador'])], p.getOneProveedor)
  .put([checkJwt, checkRole(['administrador'])], p.updateProveedor)
  .delete([checkJwt, checkRole(['administrador'])], p.deleteProveedor);

export default router;
