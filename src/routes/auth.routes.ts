import { Router } from 'express';
import passport from 'passport';
import { checkRole } from '../middlewares/roles';

import { createUsuario, login } from './../controllers/auth.controller';

const router = Router();

router.route('/usuario')
	.get()
	.post([passport.authenticate('jwt', { session: false }), checkRole(['administrador'])], createUsuario);

router.route('/signUp')
	.post(login);

router.route('/:id')
	.get()
	.delete()
	.put();

export default router;
