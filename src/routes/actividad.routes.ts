import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addActividad, getActividadesCronograma, getAllActividades, updateActividad, deleteActividad } from './../controllers/actividad.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		// [passport.authenticate('jwt', { session: false })],
		getAllActividades
	)
	.post(
		// passport.authenticate('jwt', { session: false }),
		addActividad
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getActividadesCronograma
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateActividad
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteActividad
	);

export default router;