import App from './../classes/app';
import express from 'express';

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

import categoriaProductoRoutes from '../routes/liraki/categoria.producto.routes';

import herramientaRoutes from '../routes/mendozarq/herramienta.routes';



export const routes = () => {

	const app = App.instance.app;



	app.use('/api/file', s3Routes);
	app.use('/api/usuario', usuarioRoutes);
	app.use('/api/auth', authRoutes);
	app.use('/api/personal', personalRoutes);
	app.use('/api/herramienta', herramientaRoutes);
	app.use('/api/proyecto', proyectoRoutes);
	app.use('/api/documentos', documentosRoutes);
	app.use('/api/participantes', participantesRoutes);
	app.use('/api/servicioProyecto', servicioProyectoRoutes);
	app.use('/api/visitaProyecto', visitaProyectoRoutes);
	app.use('/api/observacionServicio', observacionServicioRoutes);
	app.use('/api/observacionPersonal', observacionPersonalRoutes);
	app.use('/api/participanteVisita', participanteVisitaRoutes);
	app.use('/api/presupuestos', presupuestosRoutes);
	app.use('/api/capituloPresupuesto', capituloPresupuestoRoutes);
	app.use('/api/detalleCapitulo', detalleCapituloRoutes);

	app.use('/api/categoriaProducto', categoriaProductoRoutes);

};
