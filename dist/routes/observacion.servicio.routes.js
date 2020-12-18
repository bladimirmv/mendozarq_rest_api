"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const observacion_servicio_controller_1 = require("../controllers/observacion.servicio.controller");
const router = express_1.Router();
router.route('/')
    .post(
// passport.authenticate('jwt', { session: false }),
observacion_servicio_controller_1.addObservacionServicio);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
observacion_servicio_controller_1.getObservacionServicio)
    .put(
// passport.authenticate('jwt', { session: false }),
observacion_servicio_controller_1.updateObservacionServicio)
    .delete(
// passport.authenticate('jwt', { session: false }),
observacion_servicio_controller_1.deleteObservacionServicio);
exports.default = router;
