import { Router } from 'express';

import * as pv from './../../controllers/mendozarq/participante.visita.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';


const router: Router = Router();

router.route('/')
	.post(
		[checkJwt, checkRole(['administrador'])],
		pv.addParticipanteVisita
	);

router.route('/:uuid')
	.get(
		[checkJwt, checkRole(['administrador'])],
		pv.getAllParticipanteVisita
	)
	.delete(
		[checkJwt, checkRole(['administrador'])],
		pv.deleteParticipanteVisita
	);


router.route('/uuid/:uuid')
	.get(
		[checkJwt, checkRole(['administrador'])],
		pv.getAllUsuarioByUuidVisita
	);

export default router;
