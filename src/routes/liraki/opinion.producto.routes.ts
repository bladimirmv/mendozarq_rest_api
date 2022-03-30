import { Router } from 'express';

import * as cp from '../../controllers/liraki/opinion.producto.controller';
import { checkJwt } from '../../middlewares/jwt';
import { checkRole } from '../../middlewares/roles';

const router = Router();

router
  .route('/')
  .get([checkJwt, checkRole(['administrador', 'vendedor'])], cp.getAllOpinionProducto)
  .post([checkJwt, checkRole(['administrador', 'cliente', 'vendedor', 'arquitecto'])], cp.addOpinionProducto);

router
  .route('/:uuid')
  .get(cp.getAllOpinionProductoByUuid)
  .delete([checkJwt, checkRole(['administrador'])], cp.deleteOpinionProducto)
  .put([checkJwt, checkRole(['administrador', 'vendedor'])], cp.updateOpinion);

export default router;
