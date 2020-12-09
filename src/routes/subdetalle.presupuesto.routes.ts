import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addSubdetallePresupuestoDeObra, getSubdetallePresupuestoDeObra, getAllSubdetallePresupuestosDeObra, updateSubdetallePresupuestoDeObra, deleteSubdetallePresupuestoDeObra } from '../controllers/subdetalle.presupuesto.controller';
import { checkRole } from '../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		// [passport.authenticate('jwt', { session: false })],
		getAllSubdetallePresupuestosDeObra
	)
	.post(
		// passport.authenticate('jwt', { session: false }),
		addSubdetallePresupuestoDeObra
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getSubdetallePresupuestoDeObra
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateSubdetallePresupuestoDeObra
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteSubdetallePresupuestoDeObra
	);

export default router;