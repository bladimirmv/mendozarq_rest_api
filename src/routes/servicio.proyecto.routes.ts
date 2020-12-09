import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addServicioProyecto, getServicioProyecto, getAllServiciosProyecto, updateServicioProyecto, deleteServicioProyecto } from './../controllers/servicio.proyecto.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		// [passport.authenticate('jwt', { session: false })],
		getAllServiciosProyecto
	)
	.post(
		// passport.authenticate('jwt', { session: false }),
		addServicioProyecto
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getServicioProyecto
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateServicioProyecto
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteServicioProyecto
	);

export default router;