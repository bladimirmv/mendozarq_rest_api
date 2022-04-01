import { Router } from 'express';
import multer from 'multer';

import * as p from '../../controllers/mendozarq/proyecto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const upload = multer().any();

const router = Router();

router
  .route('/')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], p.getAllProyecto)
  .post([checkJwt, checkRole(['administrador', 'arquitecto'])], p.addProyecto);

router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], p.getOneProyecto)
  .put([checkJwt, checkRole(['administrador', 'arquitecto'])], p.updateProyecto)
  .delete([checkJwt, checkRole(['administrador'])], p.deleteProyecto);

export default router;
