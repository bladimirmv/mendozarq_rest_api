"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.App = void 0;
const express_1 = __importDefault(require("express"));
const morgan_1 = __importDefault(require("morgan"));
const cors_1 = __importDefault(require("cors"));
// import passport from 'passport';
// import passportMiddleware from './middlewares/passport';
// Routes
const index_routes_1 = __importDefault(require("./routes/index.routes"));
const usuario_routes_1 = __importDefault(require("./routes/auth/usuario.routes"));
const auth_routes_1 = __importDefault(require("./routes/auth/auth.routes"));
const categoria_recurso_routes_1 = __importDefault(require("./routes/mendozarq/categoria.recurso.routes"));
const recurso_routes_1 = __importDefault(require("./routes/mendozarq/recurso.routes"));
// import bodyParser 'body-parser';
class App {
    constructor(port) {
        this.port = port;
        this.app = express_1.default();
        this.settings();
        this.middlewares();
        this.routes();
    }
    // settings
    settings() {
        this.app.set('port', this.port || process.env.PORT || 3000);
    }
    // middlewares
    middlewares() {
        this.app.use(morgan_1.default('dev'));
        this.app.use(cors_1.default());
        this.app.use(express_1.default.json());
        this.app.use(express_1.default.urlencoded({ extended: false }));
        // this.app.use(passport.initialize());
        // passport.use(passportMiddleware);
    }
    // routes
    routes() {
        this.app.use(index_routes_1.default);
        this.app.use('/api/usuario', usuario_routes_1.default);
        this.app.use('/api/auth', auth_routes_1.default);
        this.app.use('/api/categoriarecurso', categoria_recurso_routes_1.default);
        this.app.use('/api/recurso', recurso_routes_1.default);
    }
    // listen on port
    listen() {
        return __awaiter(this, void 0, void 0, function* () {
            try {
                yield this.app.listen(this.app.get('port'));
            }
            catch (error) {
                console.log(error);
            }
            // let server = require('http').Server(this.app);
            // const io = require('socket.io')(server);
            // io.on('connection', function (socket: any) {
            // 	console.log("a user connected id: ", socket);
            // });
            // server.listen(this.port || process.env.PORT || 3000, () => {
            // 	console.log("listening socket.io on *:3000");
            // });
        });
    }
}
exports.App = App;
