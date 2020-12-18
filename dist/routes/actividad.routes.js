"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const actividad_controller_1 = require("./../controllers/actividad.controller");
const router = express_1.Router();
router.route('/')
    .get(
// [passport.authenticate('jwt', { session: false })],
actividad_controller_1.getAllActividades)
    .post(
// passport.authenticate('jwt', { session: false }),
actividad_controller_1.addActividad);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
actividad_controller_1.getActividadesCronograma)
    .put(
// passport.authenticate('jwt', { session: false }),
actividad_controller_1.updateActividad)
    .delete(
// passport.authenticate('jwt', { session: false }),
actividad_controller_1.deleteActividad);
exports.default = router;
