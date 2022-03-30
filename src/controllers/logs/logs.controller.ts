import { VentaView, ConceptoVentaView } from './../../models/liraki/venta.producto.interface';
import App from './../../classes/app';
import { Socket } from 'socket.io';
import { Pool } from 'mysql2/promise';
import { connect } from '../../classes/database';
import { FieldPacket } from 'mysql';
import { Logs } from './../../models/logs/logs.interface';
import SocketIO from 'socket.io';
import { Roles } from '../../models/auth/usuario.interface';

// ====================> getAllPersonal
export const getAllLogs = async (client: Socket, io: SocketIO.Server) => {
  try {
    client.on('ws:getLogs', async () => {
      const conn: Pool = await connect();
      let logs: Logs[] = [];
      const [rows]: [any[], FieldPacket[]] = await conn.query(`SELECT * FROM logs ORDER BY creadoEn DESC`);

      logs = rows;
      io.to('administrador' as Roles).emit('ws:getLogs', logs);
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return new Error(error as string);
  }
};

export const emitAllLogs = async () => {
  try {
    const app = App.instance;
    const conn: Pool = await connect();
    let logs: Logs[] = [];
    const [rows]: [any[], FieldPacket[]] = await conn.query(`SELECT * FROM logs ORDER BY creadoEn DESC`);
    logs = rows;

    app.io.to('administrador' as Roles).emit('ws:getLogs', logs);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return new Error(error as string);
  }
};

export const emitVentas = async (uuid: string) => {
  try {
    const app = App.instance;
    const conn: Pool = await connect();

    let ventas: VentaView[] = [];
    let conceptos: ConceptoVentaView[] = [];
    let ventasCliente: VentaView[] = [] as VentaView[];

    const [ventas_rows]: [any[], FieldPacket[]] = await conn.query(
      `SELECT v.*, concat_ws(' ', c.nombre, c.apellidoPaterno, c.apellidoMaterno) as cliente,concat_ws(' ', vr.nombre, vr.apellidoPaterno, vr.apellidoMaterno) as vendedor
			FROM venta AS v
			INNER JOIN usuario c on v.uuidCliente = c.uuid
			INNER JOIN usuario vr on v.uuidVendedor = vr.uuid
			WHERE v.tipoVenta = 'fisica' AND v.estado != 'pagando'
			ORDER BY v.creadoEn DESC;`
    );
    const [conceptos_rows]: [any[], FieldPacket[]] = await conn.query(
      `SELECT cv.*, p.nombre as nombre, p.stock as stock
			FROM venta AS v
							 INNER JOIN conceptoVenta cv on v.uuid = cv.uuidVenta
			INNER JOIN producto p on cv.uuidProducto = p.uuid
			WHERE v.tipoVenta = 'fisica' AND v.estado != 'pagando'
			ORDER BY p.nombre;`
    );

    ventas = ventas_rows;
    conceptos = conceptos_rows;

    ventas.forEach((venta) => {
      venta.conceptos = conceptos.filter((concepto) => concepto.uuidVenta === venta.uuid);
    });

    ventasCliente = ventas.filter((venta) => venta.uuidCliente === uuid);

    app.io.to('administrador' as Roles).emit('ws:ventas', ventas);
    app.io.to('vendedor' as Roles).emit('ws:ventas', ventas);
    app.io.to(uuid).emit('ws:ventas', ventasCliente);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return new Error(error as string);
  }
};

export const getAllVentasFisicas = async (client: Socket, io: SocketIO.Server) => {
  try {
    const conn: Pool = await connect();
    let ventas: VentaView[] = [];
    let conceptos: ConceptoVentaView[] = [];

    client.on('ws:ventas', async (data) => {
      if (data) {
        const [ventas_rows]: [any[], FieldPacket[]] = await conn.query(
          `SELECT v.*, concat_ws(' ', c.nombre, c.apellidoPaterno, c.apellidoMaterno) as cliente,concat_ws(' ', vr.nombre, vr.apellidoPaterno, vr.apellidoMaterno) as vendedor
          FROM venta AS v
          INNER JOIN usuario c on v.uuidCliente = c.uuid
          INNER JOIN usuario vr on v.uuidVendedor = vr.uuid
          WHERE v.tipoVenta = 'fisica' AND v.estado != 'pagando' AND v.uuidCliente = ?
          ORDER BY v.creadoEn DESC;`,
          [data.uuid]
        );

        const [conceptos_rows]: [any[], FieldPacket[]] = await conn.query(
          `SELECT cv.*, p.nombre as nombre, p.stock as stock
          FROM venta AS v
                   INNER JOIN conceptoVenta cv on v.uuid = cv.uuidVenta
          INNER JOIN producto p on cv.uuidProducto = p.uuid
          WHERE v.tipoVenta = 'fisica' AND v.estado != 'pagando' AND v.uuidCliente = ?
          ORDER BY p.nombre;`,
          [data.uuid]
        );
        ventas = ventas_rows;
        conceptos = conceptos_rows;

        ventas.forEach((venta) => {
          venta.conceptos = conceptos.filter((concepto) => concepto.uuidVenta === venta.uuid);
        });
        io.to(String(data.uuid)).emit('ws:ventas', ventas);
      }

      if (!data) {
        const [ventas_rows]: [any[], FieldPacket[]] = await conn.query(
          `SELECT v.*, concat_ws(' ', c.nombre, c.apellidoPaterno, c.apellidoMaterno) as cliente,concat_ws(' ', vr.nombre, vr.apellidoPaterno, vr.apellidoMaterno) as vendedor
          FROM venta AS v
          INNER JOIN usuario c on v.uuidCliente = c.uuid
          INNER JOIN usuario vr on v.uuidVendedor = vr.uuid
          WHERE v.tipoVenta = 'fisica' AND v.estado != 'pagando'
          ORDER BY v.creadoEn DESC;`
        );

        const [conceptos_rows]: [any[], FieldPacket[]] = await conn.query(
          `SELECT cv.*, p.nombre as nombre, p.stock as stock
          FROM venta AS v
                   INNER JOIN conceptoVenta cv on v.uuid = cv.uuidVenta
          INNER JOIN producto p on cv.uuidProducto = p.uuid
          WHERE v.tipoVenta = 'fisica' AND v.estado != 'pagando'
          ORDER BY p.nombre;`
        );
        ventas = ventas_rows;
        conceptos = conceptos_rows;

        ventas.forEach((venta) => {
          venta.conceptos = conceptos.filter((concepto) => concepto.uuidVenta === venta.uuid);
        });

        io.to('administrador' as Roles).emit('ws:ventas', ventas);
        io.to('vendedor' as Roles).emit('ws:ventas', ventas);
      }
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return new Error(error as string);
  }
};

export const emitVentasOnline = async (uuid: string) => {
  try {
    const app = App.instance;
    const conn: Pool = await connect();

    let ventas: VentaView[] = [];
    let conceptos: ConceptoVentaView[] = [];
    let ventasCliente: VentaView[] = [] as VentaView[];

    const [ventas_rows]: [any[], FieldPacket[]] = await conn.query(
      `SELECT v.*, concat_ws(' ', c.nombre, c.apellidoPaterno, c.apellidoMaterno) as cliente,concat_ws(' ', vr.nombre, vr.apellidoPaterno, vr.apellidoMaterno) as vendedor
			FROM venta AS v
			INNER JOIN usuario c on v.uuidCliente = c.uuid
			INNER JOIN usuario vr on v.uuidVendedor = vr.uuid
			WHERE v.tipoVenta = 'online' AND v.estado != 'pagando'
			ORDER BY v.creadoEn DESC;`
    );
    const [conceptos_rows]: [any[], FieldPacket[]] = await conn.query(
      `SELECT cv.*, p.nombre as nombre, p.stock as stock
			FROM venta AS v
							 INNER JOIN conceptoVenta cv on v.uuid = cv.uuidVenta
			INNER JOIN producto p on cv.uuidProducto = p.uuid
			WHERE v.tipoVenta = 'online' AND v.estado != 'pagando'
			ORDER BY p.nombre;`
    );

    ventas = ventas_rows;
    conceptos = conceptos_rows;

    ventas.forEach((venta) => {
      venta.conceptos = conceptos.filter((concepto) => concepto.uuidVenta === venta.uuid);
    });

    ventasCliente = ventas.filter((venta) => venta.uuidCliente === uuid);

    app.io.to('administrador' as Roles).emit('ws:ventas-online', ventas);
    app.io.to('vendedor' as Roles).emit('ws:ventas-online', ventas);
    app.io.to(uuid).emit('ws:ventas-online', ventasCliente);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return new Error(error as string);
  }
};

export const getAllVentasOnline = async (client: Socket, io: SocketIO.Server) => {
  try {
    const conn: Pool = await connect();
    let ventas: VentaView[] = [];
    let conceptos: ConceptoVentaView[] = [];

    client.on('ws:ventas-online', async (data) => {
      if (data) {
        const [ventas_rows]: [any[], FieldPacket[]] = await conn.query(
          `SELECT v.*, concat_ws(' ', c.nombre, c.apellidoPaterno, c.apellidoMaterno) as cliente,concat_ws(' ', vr.nombre, vr.apellidoPaterno, vr.apellidoMaterno) as vendedor
          FROM venta AS v
          INNER JOIN usuario c on v.uuidCliente = c.uuid
          INNER JOIN usuario vr on v.uuidVendedor = vr.uuid
          WHERE v.tipoVenta = 'online' AND v.estado != 'pagando' AND v.uuidCliente = ?
          ORDER BY v.creadoEn DESC;`,
          [data.uuid]
        );

        const [conceptos_rows]: [any[], FieldPacket[]] = await conn.query(
          `SELECT cv.*, p.nombre as nombre, p.stock as stock
          FROM venta AS v
                   INNER JOIN conceptoVenta cv on v.uuid = cv.uuidVenta
          INNER JOIN producto p on cv.uuidProducto = p.uuid
          WHERE v.tipoVenta = 'online' AND v.estado != 'pagando' AND v.uuidCliente = ?
          ORDER BY p.nombre;`,
          [data.uuid]
        );
        ventas = ventas_rows;
        conceptos = conceptos_rows;

        ventas.forEach((venta) => {
          venta.conceptos = conceptos.filter((concepto) => concepto.uuidVenta === venta.uuid);
        });
        io.to(String(data.uuid)).emit('ws:ventas-online', ventas);
      }

      if (!data) {
        const [ventas_rows]: [any[], FieldPacket[]] = await conn.query(
          `SELECT v.*, concat_ws(' ', c.nombre, c.apellidoPaterno, c.apellidoMaterno) as cliente,concat_ws(' ', vr.nombre, vr.apellidoPaterno, vr.apellidoMaterno) as vendedor
          FROM venta AS v
          INNER JOIN usuario c on v.uuidCliente = c.uuid
          INNER JOIN usuario vr on v.uuidVendedor = vr.uuid
          WHERE v.tipoVenta = 'online' AND v.estado != 'pagando'
          ORDER BY v.creadoEn DESC;`
        );

        const [conceptos_rows]: [any[], FieldPacket[]] = await conn.query(
          `SELECT cv.*, p.nombre as nombre, p.stock as stock
          FROM venta AS v
                   INNER JOIN conceptoVenta cv on v.uuid = cv.uuidVenta
          INNER JOIN producto p on cv.uuidProducto = p.uuid
          WHERE v.tipoVenta = 'online' AND v.estado != 'pagando'
          ORDER BY p.nombre;`
        );
        ventas = ventas_rows;
        conceptos = conceptos_rows;

        ventas.forEach((venta) => {
          venta.conceptos = conceptos.filter((concepto) => concepto.uuidVenta === venta.uuid);
        });

        io.to('administrador' as Roles).emit('ws:ventas-online', ventas);
        io.to('vendedor' as Roles).emit('ws:ventas-online', ventas);
      }
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return new Error(error as string);
  }
};
