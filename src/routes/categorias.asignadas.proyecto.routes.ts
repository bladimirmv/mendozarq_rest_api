import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addCategriasAsignadasProyecto, getCategriasAsignadasProyecto, updateCategriasAsignadasProyecto, deleteCategriasAsignadasProyecto } from '../controllers/categorias.asignadas.proyecto.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.post(
		// passport.authenticate('jwt', { session: false }),
		addCategriasAsignadasProyecto
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getCategriasAsignadasProyecto
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateCategriasAsignadasProyecto
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteCategriasAsignadasProyecto
	);

export default router;