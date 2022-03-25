import { Router } from 'express';
import * as pp from './../../controllers/liraki/pedido.producto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const router = Router();

router
  .route('/')
  .get([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], pp.getAllPedido)
  .post([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], pp.addPedidoProducto);

router
  .route('/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], pp.getOnePedido);

router
  .route('/cliente/:uuid')
  .get([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], pp.getOnePedidoByCliente);
export default router;
