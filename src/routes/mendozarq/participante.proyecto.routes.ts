import { Router } from 'express';
import multer from 'multer';

import * as pp from '../../controllers/mendozarq/participante.proyecto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router = Router();

router.route('/usuario').post([checkJwt, checkRole(['administrador'])], pp.addUsuarioProyecto);

router
  .route('/usuario/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], pp.getAllUsuarioProyecto)
  .delete([checkJwt, checkRole(['administrador'])], pp.deleteUsuarioProyecto);

router
  .route('/usuario/proyecto/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], pp.getAllUsuarioByUuid);

// ====================> Personal Participante

router.route('/personal').post([checkJwt, checkRole(['administrador', 'arquitecto'])], pp.addPersonalProyecto);

router
  .route('/personal/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], pp.getAllPersonalProyecto)
  .delete([checkJwt, checkRole(['administrador'])], pp.deletePersonalProyecto);

router
  .route('/personal/proyecto/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], pp.getAllPersonalByUuid);

export default router;
