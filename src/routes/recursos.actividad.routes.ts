import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addRecursosActividad, getRecursosActividad, updateRecursosActividad, deleteRecursosActividad } from '../controllers/recursos.actividad.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.post(
		// passport.authenticate('jwt', { session: false }),
		addRecursosActividad
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getRecursosActividad
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateRecursosActividad
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteRecursosActividad
	);

export default router;