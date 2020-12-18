"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
// controllers
const cronograma_controller_1 = require("./../controllers/cronograma.controller");
const router = express_1.Router();
router.route('/')
    .get(
// [passport.authenticate('jwt', { session: false })],
cronograma_controller_1.getAllCronogramas)
    .post(
// passport.authenticate('jwt', { session: false }),
cronograma_controller_1.addCronograma);
router.route('/:id')
    .get(
// passport.authenticate('jwt', { session: false }),
cronograma_controller_1.getCronograma)
    .put(
// passport.authenticate('jwt', { session: false }),
cronograma_controller_1.updateCronograma)
    .delete(
// passport.authenticate('jwt', { session: false }),
cronograma_controller_1.deleteCronograma);
exports.default = router;
