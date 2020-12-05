"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const usuario_controller_1 = require("./../controllers/usuario.controller");
const router = express_1.Router();
router.route('/')
    .get(
// passport.authenticate('jwt', { session: false }),
usuario_controller_1.getAllUsuarios)
    .post(
// passport.authenticate('jwt', { session: false }),
usuario_controller_1.addUsuario);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
usuario_controller_1.getUsuario)
    .put(
// passport.authenticate('jwt', { session: false }),
usuario_controller_1.updateUsuario)
    .delete(
// passport.authenticate('jwt', { session: false }),
usuario_controller_1.deleteUsuario);
exports.default = router;
