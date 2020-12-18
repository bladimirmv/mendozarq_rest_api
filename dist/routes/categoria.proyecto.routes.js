"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const categoria_proyecto_controller_1 = require("./../controllers/categoria.proyecto.controller");
const router = express_1.Router();
router.route('/')
    .get(
// [passport.authenticate('jwt', { session: false })],
categoria_proyecto_controller_1.getAllCategoriasProyecto)
    .post(
// passport.authenticate('jwt', { session: false }),
categoria_proyecto_controller_1.addCategoriaProyecto);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
categoria_proyecto_controller_1.getCategoriaProyecto)
    .put(
// passport.authenticate('jwt', { session: false }),
categoria_proyecto_controller_1.updateCategoriaProyecto)
    .delete(
// passport.authenticate('jwt', { session: false }),
categoria_proyecto_controller_1.deleteCategriaProyecto);
exports.default = router;
