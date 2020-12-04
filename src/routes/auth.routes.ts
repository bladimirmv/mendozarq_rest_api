import { Router } from 'express';

import { createUsuario, login } from './../controllers/auth.controller';

const router = Router();

router.route('/usuario')
	.get()
	.post(createUsuario);

router.route('/signUp')
	.post(login);

router.route('/:id')
	.get()
	.delete()
	.put();

export default router;
