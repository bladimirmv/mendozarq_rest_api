import { Router } from 'express';

import * as r from './../../controllers/mendoraki/recurso.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router: Router = Router();
// ====================> route  /
router
  .route('/')
  .get([checkJwt, checkRole(['administrador'])], r.getAllRecurso)
  .post([checkJwt, checkRole(['administrador'])], r.addRecurso);

// ====================> route  /:id
router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador'])], r.getOneRecurso)
  .put([checkJwt, checkRole(['administrador'])], r.updateRecurso)
  .delete([checkJwt, checkRole(['administrador'])], r.deleteRecurso);

export default router;
