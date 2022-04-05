import { Router } from 'express';
import multer from 'multer';

import * as o from './../../controllers/mendozarq/observacion.obra.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const upload = multer().any();
const router: Router = Router();

router.route('/').post([checkJwt, checkRole(['administrador', 'arquitecto'])], o.addObservacion);

router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], o.getAllObservacionByVisita)
  .put([checkJwt, checkRole(['administrador', 'arquitecto'])], o.updateObservacion)
  .delete([checkJwt, checkRole(['administrador', 'arquitecto'])], o.deleteObservacion);

router.route('/foto').post([checkJwt, checkRole(['administrador', 'arquitecto'])], upload, o.addFotoObservacion);
router.route('/foto/:uuid').delete([checkJwt, checkRole(['administrador', 'arquitecto'])], o.deleteFotoObservacion);

export default router;
