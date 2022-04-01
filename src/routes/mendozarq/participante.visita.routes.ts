import { Router } from 'express';

import * as pv from './../../controllers/mendozarq/participante.visita.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router: Router = Router();

router.route('/').post([checkJwt, checkRole(['administrador', 'arquitecto'])], pv.addParticipanteVisita);

router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], pv.getAllParticipanteVisita)
  .delete([checkJwt, checkRole(['administrador', 'arquitecto'])], pv.deleteParticipanteVisita);

router.route('/uuid/:uuid').get([checkJwt, checkRole(['administrador', 'arquitecto'])], pv.getAllUsuarioByUuidVisita);

router
  .route('/usuario/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], pv.getAllVisitasPendientesByUsuario);
export default router;
