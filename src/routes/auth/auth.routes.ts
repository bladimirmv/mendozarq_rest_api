import { Router } from 'express';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from '../../middlewares/roles';

import { createUsuario, login } from './../../controllers/auth/auth.controller';

const router = Router();
// passport.authenticate('jwt', { session: false })
router.route('/usuario')
	.get()
	.post([checkJwt, checkRole(['administrador'])], createUsuario);

router.route('/login')
	.post(login);

router.route('/:id')
	.get()
	.delete()
	.put();

export default router;
