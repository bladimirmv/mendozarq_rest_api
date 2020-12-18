"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const presupuesto_obra_controller_1 = require("./../controllers/presupuesto.obra.controller");
const router = express_1.Router();
router.route('/')
    .get(
// [passport.authenticate('jwt', { session: false })],
presupuesto_obra_controller_1.getAllPresupuestosDeObra)
    .post(
// passport.authenticate('jwt', { session: false }),
presupuesto_obra_controller_1.addPresupuestoDeObra);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
presupuesto_obra_controller_1.getPresupuestoDeObra)
    .put(
// passport.authenticate('jwt', { session: false }),
presupuesto_obra_controller_1.updatePresupuestoDeObra)
    .delete(
// passport.authenticate('jwt', { session: false }),
presupuesto_obra_controller_1.deletePresupuestoDeObra);
exports.default = router;
