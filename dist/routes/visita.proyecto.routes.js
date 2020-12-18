"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const visita_proyecto_controller_1 = require("./../controllers/visita.proyecto.controller");
const router = express_1.Router();
router.route('/')
    .get(
// [passport.authenticate('jwt', { session: false })],
visita_proyecto_controller_1.getAllVisitasProyecto)
    .post(
// passport.authenticate('jwt', { session: false }),
visita_proyecto_controller_1.addVisitaProyecto);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
visita_proyecto_controller_1.getVisitaProyecto)
    .put(
// passport.authenticate('jwt', { session: false }),
visita_proyecto_controller_1.updateVisitaProyecto)
    .delete(
// passport.authenticate('jwt', { session: false }),
visita_proyecto_controller_1.deleteVisitaProyecto);
exports.default = router;
