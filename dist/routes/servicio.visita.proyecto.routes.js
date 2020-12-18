"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const servicio_visita_proyecto_controller_1 = require("../controllers/servicio.visita.proyecto.controller");
const router = express_1.Router();
router.route('/')
    .post(
// passport.authenticate('jwt', { session: false }),
servicio_visita_proyecto_controller_1.addServicioVisitaProyecto);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
servicio_visita_proyecto_controller_1.getServicioVisitaProyecto)
    .put(
// passport.authenticate('jwt', { session: false }),
servicio_visita_proyecto_controller_1.updateServicioVisitaProyecto)
    .delete(
// passport.authenticate('jwt', { session: false }),
servicio_visita_proyecto_controller_1.deleteServicioVisitaProyecto);
exports.default = router;
