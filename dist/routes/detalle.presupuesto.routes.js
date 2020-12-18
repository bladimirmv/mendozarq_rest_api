"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const detalle_presupuesto_controller_1 = require("./../controllers/detalle.presupuesto.controller");
const router = express_1.Router();
router.route('/')
    .get(
// [passport.authenticate('jwt', { session: false })],
detalle_presupuesto_controller_1.getAllDetallePresupuestosDeObra)
    .post(
// passport.authenticate('jwt', { session: false }),
detalle_presupuesto_controller_1.addDetallePresupuestoDeObra);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
detalle_presupuesto_controller_1.getDetallePresupuestoDeObra)
    .put(
// passport.authenticate('jwt', { session: false }),
detalle_presupuesto_controller_1.updateDetallePresupuestoDeObra)
    .delete(
// passport.authenticate('jwt', { session: false }),
detalle_presupuesto_controller_1.deleteDetallePresupuestoDeObra);
exports.default = router;
