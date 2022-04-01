import { Router } from 'express';

import * as sp from './../../controllers/mendozarq/servicio.proyecto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router: Router = Router();

router
  .route('/')

  .post([checkJwt, checkRole(['administrador', 'arquitecto'])], sp.addServicioProyecto);

router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], sp.getOneServicioProyecto)
  .put([checkJwt, checkRole(['administrador', 'arquitecto'])], sp.updateServicioProyecto)
  .delete([checkJwt, checkRole(['administrador', 'arquitecto'])], sp.deleteServicioProyecto);

router.route('/proyecto/:uuid').get([checkJwt, checkRole(['administrador', 'arquitecto'])], sp.getAllServicioProyecto);

export default router;
