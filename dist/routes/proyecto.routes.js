"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const proyecto_controller_1 = require("./../controllers/proyecto.controller");
const router = express_1.Router();
router.route('/')
    .get(
// [passport.authenticate('jwt', { session: false })],
proyecto_controller_1.getAllProyectos)
    .post(
// passport.authenticate('jwt', { session: false }),
proyecto_controller_1.addProyecto);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
proyecto_controller_1.getProyecto)
    .put(
// passport.authenticate('jwt', { session: false }),
proyecto_controller_1.updateProyecto)
    .delete(
// passport.authenticate('jwt', { session: false }),
proyecto_controller_1.deleteProyecto);
exports.default = router;
