import { Router } from 'express';
// librarys
// controllers
import { addCategoriaRecurso, getCategoriaRecurso, getAllCategoriasRecurso, updateCategoriaRecurso, deleteCategriaRecurso } from '../../controllers/categoria.recurso.controller';
import { checkRole } from '../../middlewares/roles';
import { checkJwt } from './../../middlewares/jwt';


const router = Router();

router.route('/')
	.get(
		[checkJwt, checkRole(['administrador'])],
		getAllCategoriasRecurso
	)
	.post(
		[checkJwt, checkRole(['administrador'])],
		addCategoriaRecurso
	);

router.route('/:id')
	.get(
		[checkJwt, checkRole(['administrador'])],
		getCategoriaRecurso
	)
	.put(
		[checkJwt, checkRole(['administrador'])],
		updateCategoriaRecurso
	)
	.delete(
		[checkJwt, checkRole(['administrador'])],
		deleteCategriaRecurso
	);

export default router;