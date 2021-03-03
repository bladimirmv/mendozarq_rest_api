import { Router } from 'express';

import * as os from './../../controllers/mendozarq/observacion.servicio.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';


const router: Router = Router();

router.route('/')

	.post(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		os.addObservacionServicio
	);

router.route('/:uuid')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		os.getOneObservacionServicio
	)
	.put(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		os.updateObservacionServicio
	)
	.delete(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		os.deleteObservacionServicio
	);

router.route('/visita/:uuid')
	.get(
		[checkJwt, checkRole(['administrador', 'arquitecto'])],
		os.getAllObservacionServicio
	)

export default router;