import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addCronograma, getCronograma, getAllCronogramas, updateCronograma, deleteCronograma } from './../controllers/cronograma.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		// [passport.authenticate('jwt', { session: false })],
		getAllCronogramas
	)
	.post(
		// passport.authenticate('jwt', { session: false }),
		addCronograma
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getCronograma
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateCronograma
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteCronograma
	);

export default router;