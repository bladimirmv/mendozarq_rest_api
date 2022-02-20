import { Router } from 'express';
import multer from 'multer';

import * as cp from './../../controllers/liraki/categoria.producto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const upload = multer().any();
const router = Router();

router
  .route('/')
  .get(cp.getAllcategoriaProducto)
  .post([checkJwt, checkRole(['administrador'])], upload, cp.addCategoriaProducto);

router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador'])], cp.getOneCategoriaProducto)
  .put([checkJwt, checkRole(['administrador'])], cp.updatecategoriaProducto)
  .delete([checkJwt, checkRole(['administrador'])], cp.deletecategoriaProducto);

router.route('/multer/:uuid').put([checkJwt, checkRole(['administrador'])], upload, cp.updatecategoriaProductoMulter);

export default router;
