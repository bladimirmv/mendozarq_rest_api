import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addProyecto, getProyecto, getAllProyectos, updateProyecto, deleteProyecto } from './../controllers/proyecto.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		// [passport.authenticate('jwt', { session: false })],
		getAllProyectos
	)
	.post(
		// passport.authenticate('jwt', { session: false }),
		addProyecto
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getProyecto
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateProyecto
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteProyecto
	);

export default router;