import { Router } from 'express';

import { login } from './../../controllers/auth/auth.controller';

const router = Router();
router.route('/login').post(login);
// router.route('/usuario').get().post();
// router.route('/:id').get().delete().put();

export default router;
