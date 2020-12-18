"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const servicio_proyecto_controller_1 = require("./../controllers/servicio.proyecto.controller");
const router = express_1.Router();
router.route('/')
    .get(
// [passport.authenticate('jwt', { session: false })],
servicio_proyecto_controller_1.getAllServiciosProyecto)
    .post(
// passport.authenticate('jwt', { session: false }),
servicio_proyecto_controller_1.addServicioProyecto);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
servicio_proyecto_controller_1.getServicioProyecto)
    .put(
// passport.authenticate('jwt', { session: false }),
servicio_proyecto_controller_1.updateServicioProyecto)
    .delete(
// passport.authenticate('jwt', { session: false }),
servicio_proyecto_controller_1.deleteServicioProyecto);
exports.default = router;
