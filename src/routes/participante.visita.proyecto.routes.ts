import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addParticipanteVisitaProyecto, getParticipanteVisitaProyecto, updateParticipanteVisitaProyecto, deleteParticipanteVisitaProyecto } from '../controllers/participante.visita.proyecto.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.post(
		// passport.authenticate('jwt', { session: false }),
		addParticipanteVisitaProyecto
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getParticipanteVisitaProyecto
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateParticipanteVisitaProyecto
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteParticipanteVisitaProyecto
	);

export default router;