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
      const [rows]: [any[], FieldPacket[]] = await conn.query(
        `SELECT * FROM logs`
      );
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
    const [rows]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM logs`
    );
    logs = rows;

    app.io.to('administrador' as Roles).emit('ws:getLogs', logs);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return new Error(error as string);
  }
};
