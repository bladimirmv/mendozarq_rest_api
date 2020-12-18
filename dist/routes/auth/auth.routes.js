"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const jwt_1 = require("./../../middlewares/jwt");
const roles_1 = require("../../middlewares/roles");
const auth_controller_1 = require("./../../controllers/auth/auth.controller");
const router = express_1.Router();
// passport.authenticate('jwt', { session: false })
router.route('/usuario')
    .get()
    .post([jwt_1.checkJwt, roles_1.checkRole(['administrador'])], auth_controller_1.createUsuario);
router.route('/login')
    .post(auth_controller_1.login);
router.route('/:id')
    .get()
    .delete()
    .put();
exports.default = router;
