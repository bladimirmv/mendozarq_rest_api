import { Router } from 'express';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from '../../middlewares/roles';

import { login } from './../../controllers/auth/auth.controller';

const router = Router();
router.route('/usuario')
	.get()
	.post();

router.route('/login')
	.post(login);

router.route('/:id')
	.get()
	.delete()
	.put();

export default router;
