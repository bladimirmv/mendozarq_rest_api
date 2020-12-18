"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const categorias_asignadas_proyecto_controller_1 = require("../controllers/categorias.asignadas.proyecto.controller");
const router = express_1.Router();
router.route('/')
    .post(
// passport.authenticate('jwt', { session: false }),
categorias_asignadas_proyecto_controller_1.addCategriasAsignadasProyecto);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
categorias_asignadas_proyecto_controller_1.getCategriasAsignadasProyecto)
    .put(
// passport.authenticate('jwt', { session: false }),
categorias_asignadas_proyecto_controller_1.updateCategriasAsignadasProyecto)
    .delete(
// passport.authenticate('jwt', { session: false }),
categorias_asignadas_proyecto_controller_1.deleteCategriasAsignadasProyecto);
exports.default = router;
