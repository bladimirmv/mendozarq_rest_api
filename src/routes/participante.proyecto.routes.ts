import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addParticipanteProyecto, getParticipanteProyecto, updateParticipanteProyecto, deleteParticipanteProyecto } from '../controllers/participante.proyecto.controller';
import { checkRole } from './../middlewares/roles';

const router = Router();

router.route('/')
	.post(
		// passport.authenticate('jwt', { session: false }),
		addParticipanteProyecto
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getParticipanteProyecto
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateParticipanteProyecto
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteParticipanteProyecto
	);

export default router;