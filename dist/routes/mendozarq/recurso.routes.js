"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const recurso_controller_1 = require("../../controllers/recurso.controller");
const roles_1 = require("../../middlewares/roles");
const jwt_1 = require("./../../middlewares/jwt");
const router = express_1.Router();
router.route('/')
    .get([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], recurso_controller_1.getAllRecursos)
    .post([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], recurso_controller_1.addRecurso);
router.route('/:id')
    .get([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], recurso_controller_1.getRecurso)
    .put([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], recurso_controller_1.updateRecurso)
    .delete([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], recurso_controller_1.deleteRecurso);
exports.default = router;
