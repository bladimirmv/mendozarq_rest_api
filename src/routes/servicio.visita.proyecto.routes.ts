import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addServicioVisitaProyecto, getServicioVisitaProyecto, updateServicioVisitaProyecto, deleteServicioVisitaProyecto } from '../controllers/servicio.visita.proyecto.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.post(
		// passport.authenticate('jwt', { session: false }),
		addServicioVisitaProyecto
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getServicioVisitaProyecto
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateServicioVisitaProyecto
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteServicioVisitaProyecto
	);

export default router;