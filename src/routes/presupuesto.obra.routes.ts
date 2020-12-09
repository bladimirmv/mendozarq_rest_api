import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addPresupuestoDeObra, getPresupuestoDeObra, getAllPresupuestosDeObra, updatePresupuestoDeObra, deletePresupuestoDeObra } from './../controllers/presupuesto.obra.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		// [passport.authenticate('jwt', { session: false })],
		getAllPresupuestosDeObra
	)
	.post(
		// passport.authenticate('jwt', { session: false }),
		addPresupuestoDeObra
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getPresupuestoDeObra
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updatePresupuestoDeObra
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deletePresupuestoDeObra
	);

export default router;