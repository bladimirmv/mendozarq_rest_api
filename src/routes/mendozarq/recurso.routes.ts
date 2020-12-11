import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addRecurso, getRecurso, getAllRecursos, updateRecurso, deleteRecurso } from '../../controllers/recurso.controller';
import { checkRole } from '../../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		// [passport.authenticate('jwt', { session: false })],
		getAllRecursos
	)
	.post(
		// passport.authenticate('jwt', { session: false }),
		addRecurso
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getRecurso
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateRecurso
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteRecurso
	);

export default router;