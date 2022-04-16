import { Router } from 'express';

import * as vp from './../../controllers/mendozarq/visita.proyecto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router: Router = Router();

router.route('/').post([checkJwt, checkRole(['administrador'])], vp.addVisitaProyecto);

router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], vp.getOneVisitaProyecto)
  .put([checkJwt, checkRole(['administrador', 'arquitecto'])], vp.updateVisitaProyecto)
  .delete([checkJwt, checkRole(['administrador'])], vp.deleteVisitaProyecto);

router.route('/proyecto/:uuid').get([checkJwt, checkRole(['administrador', 'arquitecto'])], vp.getAllVisitaProyecto);

router
  .route('/tarea/proyecto/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], vp.getAllTareasByProyecto);
export default router;
