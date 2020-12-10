import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addVisitaProyecto, getVisitaProyecto, getAllVisitasProyecto, updateVisitaProyecto, deleteVisitaProyecto } from './../controllers/visita.proyecto.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		// [passport.authenticate('jwt', { session: false })],
		getAllVisitasProyecto
	)
	.post(
		// passport.authenticate('jwt', { session: false }),
		addVisitaProyecto
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getVisitaProyecto
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateVisitaProyecto
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteVisitaProyecto
	);

export default router;