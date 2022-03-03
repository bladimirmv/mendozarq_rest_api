import { Router } from 'express';
import multer from 'multer';

import * as pp from './../../controllers/liraki/pedido.producto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const upload = multer().any();
const router = Router();

router
  .route('/')
  .post([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], pp.addPedidoProducto);
// .get(cp.getAllcategoriaProducto)

// router
//   .route('/:uuid')
//   .get([checkJwt, checkRole(['administrador'])], cp.getOneCategoriaProducto)
//   .put([checkJwt, checkRole(['administrador'])], cp.updatecategoriaProducto)
//   .delete([checkJwt, checkRole(['administrador'])], cp.deletecategoriaProducto);

// router.route('/multer/:uuid').put([checkJwt, checkRole(['administrador'])], upload, cp.updatecategoriaProductoMulter);

export default router;
