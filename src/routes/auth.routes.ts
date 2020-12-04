import { Router } from 'express';
import passport from 'passport';

import { createUsuario, login } from './../controllers/auth.controller';

const router = Router();

router.route('/usuario')
	.get()
	.post(passport.authenticate('jwt', { session: false }), createUsuario);

router.route('/signUp')
	.post(login);

router.route('/:id')
	.get()
	.delete()
	.put();

export default router;
