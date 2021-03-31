import { Router } from 'express';

import * as op from './../../controllers/mendozarq/observacion.personal.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';


const router: Router = Router();

router.route('/')

	.post(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		op.addObservacionPersonal
	);

router.route('/:uuid')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		op.getOneObservacionPersonal
	)
	.put(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		op.updateObservacionPersonal
	)
	.delete(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		op.deleteObservacionPersonal
	);

router.route('/visita/:uuid')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		op.getAllObservacionPersonal
	)

router.route('/personal/:uuid')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		op.getAllPersonalProyecto
	)

export default router;