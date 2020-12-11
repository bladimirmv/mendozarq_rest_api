import { Router } from 'express';

// controllers
import { addRecurso, getRecurso, getAllRecursos, updateRecurso, deleteRecurso } from '../../controllers/recurso.controller';
import { checkRole } from '../../middlewares/roles';
import { checkJwt } from './../../middlewares/jwt';
const router = Router();

router.route('/')
	.get(
		[checkJwt, checkRole(['administrador'])],
		getAllRecursos
	)
	.post(
		[checkJwt, checkRole(['administrador'])],
		addRecurso
	);

router.route('/:id')
	.get(
		[checkJwt, checkRole(['administrador'])],
		getRecurso
	)
	.put(
		[checkJwt, checkRole(['administrador'])],
		updateRecurso
	)
	.delete(
		[checkJwt, checkRole(['administrador'])],
		deleteRecurso
	);

export default router;