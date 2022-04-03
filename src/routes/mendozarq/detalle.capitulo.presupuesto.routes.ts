import { Router } from 'express';

import * as dc from '../../controllers/mendozarq/detalle.capitulo.presupuesto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router = Router();

router
  .route('/')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], dc.getAllDetalleCapituloPresupuesto)
  .post([checkJwt, checkRole(['administrador', 'arquitecto'])], dc.addDetalleCapituloPresupuesto);

router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], dc.getOneDetalleCapituloPresupuesto)
  .put([checkJwt, checkRole(['administrador', 'arquitecto'])], dc.updatedetalleCapituloPresupuesto)
  .delete([checkJwt, checkRole(['administrador', 'arquitecto'])], dc.deletedetalleCapituloPresupuesto);

router
  .route('/proyecto/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], dc.getAllDetalleCapitulosByProyecto);

export default router;
