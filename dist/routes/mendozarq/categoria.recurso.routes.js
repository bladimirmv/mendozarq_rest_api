"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// librarys
// controllers
const categoria_recurso_controller_1 = require("../../controllers/categoria.recurso.controller");
const roles_1 = require("../../middlewares/roles");
const jwt_1 = require("./../../middlewares/jwt");
const router = express_1.Router();
router.route('/')
    .get([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], categoria_recurso_controller_1.getAllCategoriasRecurso)
    .post([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], categoria_recurso_controller_1.addCategoriaRecurso);
router.route('/:id')
    .get([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], categoria_recurso_controller_1.getCategoriaRecurso)
    .put([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], categoria_recurso_controller_1.updateCategoriaRecurso)
    .delete([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], categoria_recurso_controller_1.deleteCategriaRecurso);
exports.default = router;
