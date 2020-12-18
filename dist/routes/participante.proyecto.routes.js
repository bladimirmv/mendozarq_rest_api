"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const participante_proyecto_controller_1 = require("../controllers/participante.proyecto.controller");
const router = express_1.Router();
router.route('/')
    .post(
// passport.authenticate('jwt', { session: false }),
participante_proyecto_controller_1.addParticipanteProyecto);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
participante_proyecto_controller_1.getParticipanteProyecto)
    .put(
// passport.authenticate('jwt', { session: false }),
participante_proyecto_controller_1.updateParticipanteProyecto)
    .delete(
// passport.authenticate('jwt', { session: false }),
participante_proyecto_controller_1.deleteParticipanteProyecto);
exports.default = router;
