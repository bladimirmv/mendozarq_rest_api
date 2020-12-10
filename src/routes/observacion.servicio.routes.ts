import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addObservacionServicio, getObservacionServicio, updateObservacionServicio, deleteObservacionServicio } from '../controllers/observacion.servicio.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.post(
		// passport.authenticate('jwt', { session: false }),
		addObservacionServicio
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getObservacionServicio
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateObservacionServicio
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteObservacionServicio
	);

export default router;