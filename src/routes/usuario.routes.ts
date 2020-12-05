import { Router } from 'express';
// librarys
import passport from 'passport';
// controllers
import { addUsuario, getUsuario, getAllUsuarios, updateUsuario, deleteUsuario } from './../controllers/usuario.controller';
const router = Router();

router.route('/')
	.get(
		// passport.authenticate('jwt', { session: false }),
		getAllUsuarios
	)
	.post(
		// passport.authenticate('jwt', { session: false }),
		addUsuario
	);

router.route('/:id')
	.get(
		// passport.authenticate('jwt', { session: false }),
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