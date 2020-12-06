"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const passport_1 = __importDefault(require("passport"));
const roles_1 = require("../middlewares/roles");
const auth_controller_1 = require("./../controllers/auth.controller");
const router = express_1.Router();
router.route('/usuario')
    .get()
    .post([passport_1.default.authenticate('jwt', { session: false }), roles_1.checkRole(['administrador'])], auth_controller_1.createUsuario);
router.route('/signUp')
    .post(auth_controller_1.login);
router.route('/:id')
    .get()
    .delete()
    .put();
exports.default = router;
