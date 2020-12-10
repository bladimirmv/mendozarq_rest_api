import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addUsuario, getUsuario, getAllUsuarios, updateUsuario, deleteUsuario } from '../../controllers/auth/usuario.controller';
import { checkRole } from '../../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		[passport.authenticate('jwt', { session: false }), checkRole(['administrador'])],
		getAllUsuarios
	)
	.post(
		[passport.authenticate('jwt', { session: false }), checkRole(['administrador'])],
		addUsuario
	);

router.route('/:id')
	.get(
		[passport.authenticate('jwt', { session: false }), checkRole(['administrador'])],
		getUsuario
	)
	.put(
		// passport.authenticate('jwt', { session: false }),
		updateUsuario
	)
	.delete(
		// passport.authenticate('jwt', { session: false }),
		deleteUsuario
	);

export default router;