import express, { Application } from 'express';
import morgan from 'morgan';
import cors from "cors";
import passport from "passport";


import passportMiddleware from "./middlewares/passport";
// Routes
import IndexRoutes from './routes/index.route';
import UsuarioRoutes from './routes/usuario.routes';
import AuthRoutes from './routes/auth.routes';


// import bodyParser 'body-parser';

export class App {
	private app: Application;

	constructor(private port?: number | string) {
		this.app = express();


		this.settings();
		this.middlewares();
		this.routes();
	}
	// settings
	private settings(): void {
		this.app.set('port', this.port || process.env.PORT || 3000);
	}
	// middlewares
	middlewares(): void {
		this.app.use(morgan('dev'));
		this.app.use(cors());
		this.app.use(express.json());
		this.app.use(express.urlencoded({ extended: false }));
		this.app.use(passport.initialize());
		passport.use(passportMiddleware);

	}
	// routes
	routes(): void {
		this.app.use(IndexRoutes);
		this.app.use('/api/usuario', UsuarioRoutes);
		this.app.use('/api/auth', AuthRoutes);

	}
	// listen on port
	async listen() {
		await this.app.listen(this.app.get('port'));
		console.log(`Server on port ${this.port}`);
	}
}