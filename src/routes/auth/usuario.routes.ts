import { Router } from 'express';

// *controllers
import {
  addUsuario,
  getUsuario,
  getAllUsuarios,
  updateUsuario,
  deleteUsuario,
  usuarioRegister,
} from '../../controllers/auth/usuario.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from '../../middlewares/roles';

const router = Router();

router
  .route('/')
  .get([checkJwt, checkRole(['administrador', 'vendedor', 'arquitecto'])], getAllUsuarios)
  .post([checkJwt, checkRole(['administrador', 'vendedor', 'arquitecto'])], addUsuario);

router
  .route('/:id')
  .get([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], getUsuario)
  .put([checkJwt, checkRole(['administrador', 'arquitecto', 'cliente', 'vendedor'])], updateUsuario)
  .delete([checkJwt, checkRole(['administrador'])], deleteUsuario);

router.route('/register/').post(usuarioRegister);

export default router;
