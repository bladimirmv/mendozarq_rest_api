import { Router } from 'express';

import * as personal from './../../controllers/mendozarq/personal.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router: Router = Router();
// ====================> route Personal /
router
  .route('/')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], personal.getAllPersonal)
  .post([checkJwt, checkRole(['administrador', 'arquitecto'])], personal.addPersonal);

// ====================> route Personal /:id
router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador'])], personal.getOnePersonal)
  .put([checkJwt, checkRole(['administrador', 'arquitecto'])], personal.updatePersonal)
  .delete([checkJwt, checkRole(['administrador'])], personal.deletePersonal);

router.route('teams/:id').delete(/* delete function*/);

export default router;
