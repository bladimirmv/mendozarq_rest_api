"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const participante_visita_proyecto_controller_1 = require("../controllers/participante.visita.proyecto.controller");
const router = express_1.Router();
router.route('/')
    .post(
// passport.authenticate('jwt', { session: false }),
participante_visita_proyecto_controller_1.addParticipanteVisitaProyecto);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
participante_visita_proyecto_controller_1.getParticipanteVisitaProyecto)
    .put(
// passport.authenticate('jwt', { session: false }),
participante_visita_proyecto_controller_1.updateParticipanteVisitaProyecto)
    .delete(
// passport.authenticate('jwt', { session: false }),
participante_visita_proyecto_controller_1.deleteParticipanteVisitaProyecto);
exports.default = router;
