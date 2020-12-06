import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addCategoriaProyecto, getCategoriaProyecto, getAllCategoriasProyecto, updateCategoriaProyecto, deleteCategriaProyecto } from './../controllers/categoria.proyecto.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		// [passport.authenticate('jwt', { session: false })],
		getAllCategoriasProyecto
	)
	.post(
		// passport.authenticate('jwt', { session: false }),
		addCategoriaProyecto
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getCategoriaProyecto
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateCategoriaProyecto
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteCategriaProyecto
	);

export default router;