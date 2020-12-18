"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const subdetalle_presupuesto_controller_1 = require("../controllers/subdetalle.presupuesto.controller");
const router = express_1.Router();
router.route('/')
    .get(
// [passport.authenticate('jwt', { session: false })],
subdetalle_presupuesto_controller_1.getAllSubdetallePresupuestosDeObra)
    .post(
// passport.authenticate('jwt', { session: false }),
subdetalle_presupuesto_controller_1.addSubdetallePresupuestoDeObra);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
subdetalle_presupuesto_controller_1.getSubdetallePresupuestoDeObra)
    .put(
// passport.authenticate('jwt', { session: false }),
subdetalle_presupuesto_controller_1.updateSubdetallePresupuestoDeObra)
    .delete(
// passport.authenticate('jwt', { session: false }),
subdetalle_presupuesto_controller_1.deleteSubdetallePresupuestoDeObra);
exports.default = router;
