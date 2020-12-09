import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addDetallePresupuestoDeObra, getDetallePresupuestoDeObra, getAllDetallePresupuestosDeObra, updateDetallePresupuestoDeObra, deleteDetallePresupuestoDeObra } from './../controllers/detalle.presupuesto.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		// [passport.authenticate('jwt', { session: false })],
		getAllDetallePresupuestosDeObra
	)
	.post(
		// passport.authenticate('jwt', { session: false }),
		addDetallePresupuestoDeObra
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getDetallePresupuestoDeObra
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateDetallePresupuestoDeObra
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteDetallePresupuestoDeObra
	);

export default router;