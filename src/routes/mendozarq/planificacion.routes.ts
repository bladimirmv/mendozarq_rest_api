import { Router } from 'express';
import multer from 'multer';
import * as p from './../../controllers/mendozarq/planificacion.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const upload = multer().any();
const router = Router();

router.route('/').post([checkJwt, checkRole(['administrador', 'arquitecto'])], p.addPlanificacionProyecto);

router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto'])], p.getPlanificacionProyecto)
  .delete([checkJwt, checkRole(['administrador', 'arquitecto'])], p.deletePlanificacionProyecto)
  .put([checkJwt, checkRole(['administrador', 'arquitecto'])], p.updatePlanificacionProyecto);

router.route('/all/:uuid').get([checkJwt, checkRole(['administrador', 'arquitecto'])], p.getAllPlanificacionProyecto);

router.route('/tarea').post([checkJwt, checkRole(['administrador', 'arquitecto'])], p.addTareaPlanificacionProyecto);

router
  .route('/tarea/:uuid')
  .delete([checkJwt, checkRole(['administrador', 'arquitecto'])], p.deleteTareaPlanificacionProyecto)
  .put([checkJwt, checkRole(['administrador', 'arquitecto'])], p.updateTareaPlanificacionProyecto);

router
  .route('/capitulo')
  .post([checkJwt, checkRole(['administrador', 'arquitecto'])], p.addCapituloPlanificacionProyecto);

router
  .route('/capitulo/:uuid')
  .delete([checkJwt, checkRole(['administrador', 'arquitecto'])], p.deleteCapituloPlanificacionProyecto)
  .put([checkJwt, checkRole(['administrador', 'arquitecto'])], p.updateCapittuloPlanificacionProyecto);

export default router;
