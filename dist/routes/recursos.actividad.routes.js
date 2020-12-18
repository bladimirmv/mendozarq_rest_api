"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const recursos_actividad_controller_1 = require("../controllers/recursos.actividad.controller");
const router = express_1.Router();
router.route('/')
    .post(
// passport.authenticate('jwt', { session: false }),
recursos_actividad_controller_1.addRecursosActividad);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
recursos_actividad_controller_1.getRecursosActividad)
    .put(
// passport.authenticate('jwt', { session: false }),
recursos_actividad_controller_1.updateRecursosActividad)
    .delete(
// passport.authenticate('jwt', { session: false }),
recursos_actividad_controller_1.deleteRecursosActividad);
exports.default = router;
