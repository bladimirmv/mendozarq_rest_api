import { Router } from 'express';

// controllers
import { addUsuario, getUsuario, getAllUsuarios, updateUsuario, deleteUsuario } from '../../controllers/auth/usuario.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from '../../middlewares/roles';

const router = Router();

router.route('/')
	.get(
		[checkJwt, checkRole(['administrador'])],
		getAllUsuarios
	)
	.post(
		[checkJwt, checkRole(['administrador'])],
		addUsuario
	);

router.route('/:id')
	.get(
		[checkJwt, checkRole(['administrador'])],
		getUsuario
	)
	.put(
		[checkJwt, checkRole(['administrador'])],
		updateUsuario
	)
	.delete(
		[checkJwt, checkRole(['administrador'])],
		deleteUsuario
	);

export default router;