import { Router } from 'express';
import multer from 'multer';
import * as p from './../../controllers/liraki/producto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const upload = multer().any();

const router = Router();

router
	.route('/')
	.get(
		p.getAllProducto
	)
	.post([checkJwt, checkRole(['administrador'])], p.addProducto);

router
	.route('/:uuid')
	.get(p.getOneProducto)
	.put([checkJwt, checkRole(['administrador'])], p.updateProducto)
	.delete([checkJwt, checkRole(['administrador'])], p.deleteProducto);


router.route('/fotoProducto')

	.post(
		[checkJwt, checkRole(['administrador'])],
		upload,
		p.addFotoProducto
	);

router.route('/fotoProducto/:uuid')
	.get(
		[checkJwt, checkRole(['administrador', 'vendedor'])],
		p.getFotoProducto
	)
	.put([checkJwt, checkRole(['administrador'])], p.updateFotoProducto)

	.delete([checkJwt, checkRole(['administrador'])], p.deleteFotoProducto);



export default router;
