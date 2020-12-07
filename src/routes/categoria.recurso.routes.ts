import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addCategoriaRecurso, getCategoriaRecurso, getAllCategoriasRecurso, updateCategoriaRecurso, deleteCategriaRecurso } from './../controllers/categoria.recurso.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		// [passport.authenticate('jwt', { session: false })],
		getAllCategoriasRecurso
	)
	.post(
		// passport.authenticate('jwt', { session: false }),
		addCategoriaRecurso
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getCategoriaRecurso
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateCategoriaRecurso
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteCategriaRecurso
	);

export default router;