"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const usuario_controller_1 = require("../../controllers/auth/usuario.controller");
const jwt_1 = require("./../../middlewares/jwt");
const roles_1 = require("../../middlewares/roles");
const router = express_1.Router();
router.route('/')
    .get([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], usuario_controller_1.getAllUsuarios)
    .post([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], usuario_controller_1.addUsuario);
router.route('/:id')
    .get([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], usuario_controller_1.getUsuario)
    .put([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], usuario_controller_1.updateUsuario)
    .delete([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], usuario_controller_1.deleteUsuario);
exports.default = router;
