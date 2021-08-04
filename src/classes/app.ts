// ==========> libraries imports
import express from 'express';
import morgan from 'morgan';
import cors from 'cors';
import http from "http";
import socketIO, { Socket, ServerOptions } from "socket.io";
import path from 'path';

// ==========> config imprts
import { SERVER_PORT } from '../global/enviroment';
import * as socket from "../webSockets/socket";

// ==========> routes imports
import IndexRoutes from '../routes/index.routes';
import s3Routes from '../routes/s3.routes';
import authRoutes from '../routes/auth/auth.routes';
import usuarioRoutes from '../routes/auth/usuario.routes';
import personalRoutes from '../routes/mendozarq/personal.routes';
import proyectoRoutes from '../routes/mendozarq/proyecto.routes';
import documentosRoutes from '../routes/mendozarq/documentos.routes';
import participantesRoutes from '../routes/mendozarq/participante.proyecto.routes';
import servicioProyectoRoutes from '../routes/mendozarq/servicio.proyecto.routes';
import visitaProyectoRoutes from '../routes/mendozarq/visita.proyecto.routes';
import participanteVisitaRoutes from '../routes/mendozarq/participante.visita.routes';
import observacionPersonalRoutes from '../routes/mendozarq/observacion.personal.routes';
import observacionServicioRoutes from '../routes/mendozarq/observacion.servicio.routes';
import presupuestosRoutes from '../routes/mendozarq/presupuesto.obra.routes';
import capituloPresupuestoRoutes from '../routes/mendozarq/capitulo.presupuesto.routes';
import detalleCapituloRoutes from '../routes/mendozarq/detalle.capitulo.presupuesto.routes';




import herramientaRoutes from '../routes/mendozarq/herramienta.routes';


// ==========> App class
export default class App {

	// ==========> Instance of App (singleton patron)
	private static _instance: App;

	// ==========> Variables
	private app: express.Application;
	public port: number;

	public io: socketIO.Server;
	private httpServer: http.Server;
	private serverOptions: Partial<ServerOptions>;

	// ==========> private constructor
	private constructor() {
		this.app = express();
		this.port = SERVER_PORT;

		this.middlewares();
		this.routes();

		this.httpServer = new http.Server(this.app);

		this.serverOptions = {
			cors: {
				origin: true,
				credentials: true
			}
		}
		this.io = new socketIO.Server(this.httpServer, this.serverOptions);

		this.listenSockets();
	}

	// ==========> instance
	public static get instance() {
		return this._instance || (this._instance = new this());
	}

	// ==========> middlewares
	middlewares(): void {
		this.app.use(morgan('dev'));
		this.app.use(express.urlencoded({ extended: true }));
		this.app.use(express.json());
		this.app.use(cors({ origin: true, credentials: true }));
		// this.app.options('*', cors());

	}

	// ==========> routes
	routes(): void {
		this.app.use(IndexRoutes);
		this.app.use('/api/file', s3Routes);
		this.app.use('/api/usuario', usuarioRoutes);
		this.app.use('/api/auth', authRoutes);
		this.app.use('/api/personal', personalRoutes);
		this.app.use('/api/herramienta', herramientaRoutes);
		this.app.use('/api/proyecto', proyectoRoutes);
		this.app.use('/api/documentos', documentosRoutes);
		this.app.use('/api/participantes', participantesRoutes);
		this.app.use('/api/servicioProyecto', servicioProyectoRoutes);
		this.app.use('/api/visitaProyecto', visitaProyectoRoutes);
		this.app.use('/api/observacionServicio', observacionServicioRoutes);
		this.app.use('/api/observacionPersonal', observacionPersonalRoutes);
		this.app.use('/api/participanteVisita', participanteVisitaRoutes);
		this.app.use('/api/presupuestos', presupuestosRoutes);
		this.app.use('/api/capituloPresupuesto', capituloPresupuestoRoutes);
		this.app.use('/api/detalleCapitulo', detalleCapituloRoutes);

	}

	// ==========> listen app
	async start() {
		try {
			await this.httpServer.listen(this.port, () => {
				console.log(`Listening server on port ==> ${this.port}`);
			});
		} catch (error) {
			console.log(`❌Ocurrio un error al escuchar en el puerto "${this.port}":`, error);
		}
	}

	// ==========> listen sockets
	private listenSockets() {
		console.log("Listening conections ==> sockets");

		this.io.on("connection", async (client: Socket) => {
			// *CLient on connected
			console.log(`ws: Client ${client.id} connected!`);

			// *logIn client
			socket.logIn(client, this.io);

			// *Mensajes
			socket.mensaje(client, this.io);

			// *Disconnect
			socket.disconnect(client);
		});
	}

}

