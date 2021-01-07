
import express from 'express';
import morgan from 'morgan';
import cors from 'cors';
import http from "http";
import socketIO, { Socket } from "socket.io";
import path from 'path';

import { SERVER_PORT } from '../global/enviroment';


import * as socket from "../webSockets/socket";

// Routes
import IndexRoutes from '../routes/index.routes';
import UsuarioRoutes from '../routes/auth/usuario.routes';
import AuthRoutes from '../routes/auth/auth.routes';
import categoriaRecurseRoutes from '../routes/mendozarq/categoria.recurso.routes'
import recurso from '../routes/mendozarq/recurso.routes'
// import bodyParser 'body-parser';
import { checkRole } from '../middlewares/roles';

import { Listener } from '../webSockets/listener';

// !Events imports
import { proyectos } from '../webSockets/events/proyecto.event';


export default class App {
	// ==========> Instance of App (singleton patron)
	private static _instance: App;

	private app: express.Application;
	public port: number;
	public io: socketIO.Server;
	private httpServer: http.Server;

	private constructor() {
		this.app = express();
		this.port = SERVER_PORT;
		this.middlewares();
		this.routes();
		this.httpServer = new http.Server(this.app);
		this.io = new socketIO.Server(this.httpServer);
		this.listenSockets();
	}
	public static get instance() {
		return this._instance || (this._instance = new this());
	}

	// ==========> middlewares
	middlewares(): void {
		this.app.use(morgan('dev'));
		this.app.use(cors({ origin: true, credentials: true }));
		this.app.use(express.json());
		this.app.use(express.urlencoded({ extended: true }));
		this.app.use(express.static(path.join(__dirname, 'public')));
	}
	// ==========> routes
	routes(): void {
		// this.app.use(IndexRoutes);
		this.app.use('/api/usuario', UsuarioRoutes);
		this.app.use('/api/auth', AuthRoutes);
		this.app.use('/api/categoriarecurso', categoriaRecurseRoutes);
		this.app.use('/api/recurso', recurso);
	}
	// ==========> listen app
	async listen() {
		try {
			await this.httpServer.listen(this.port, () => {
				console.log(`*** Listening server on: ${this.port} ***`);
			});
		} catch (error) {
			console.log(`❌Ocurrio un error al escuchar en el puerto "${this.port}":`, error);
		}
	}
	// ==========> listen sockets
	private listenSockets() {
		console.log("** Escuchando conexiones - sockets **");

		this.io.on("connection", async (client: Socket) => {
			// this.app.set('WS:client', client);
			console.log(`ws: Client ${client.id} connected!`);

			client.join('Admin');
			this.io.sockets.in('Admin').emit('WS:proyectos', [{ nombre: 'admin' }]);
			this.io.to('Admin').emit('WS:proyectos', [{ nombre: 'admin1' }]);
			client.to('Admin').emit('WS:proyectos', [{ nombre: 'client' }]);

			// client.emit('WS:proyectos', [{ nombre: 'none' }]);
			// console.log();

			// client.to(client.id).emit('WS:proyectos', [{ nombre: 'admin' }]);

			client.on('WS:proyectos', () => {
				console.log('llego');
				this.io.sockets.in('Admin').emit('WS:proyectos', [{ nombre: 'admin' }]);

			});



			//   *Mensajes
			// socket.mensaje(client, this.io);

			//   *Disconnect
			socket.disconnect(client);
		});

		this.io.on('WS:proyectos', (token) => {
			console.log('llego el token: ', token.token);

			console.log('Admin join');
			this.io.sockets.in('Admin').emit('WS:proyectos', [{ nombre: 'admin' }]);

		});
	}


}

