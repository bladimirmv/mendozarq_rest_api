import { Socket } from 'socket.io';
import socketIO from 'socket.io';
import { Roles, Usuario, UsuarioSocket } from './../models/auth/usuario.interface';
import * as jwt from 'jsonwebtoken';
import config from './../config/config';
import { TokenUsuario } from '../models/auth/usuario.interface';
import { Pool, FieldPacket } from 'mysql2/promise';
import { connect } from './../classes/database';

export const logIn = (client: Socket, io: socketIO.Server) => {
  client.on('ws:logIn', async (usuarioSocket: UsuarioSocket) => {
    try {
      if (!usuarioSocket.usuarioToken) {
        return new Error('Por favor ingrese el token porfavor!');
      }

      const { uuid }: TokenUsuario = <any>jwt.verify(usuarioSocket.usuarioToken, config.jwtSecret);
      const conn: Pool = await connect();
      const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM usuario WHERE uuid = ?', [uuid]);

      const usuario: Usuario = row;
      if (usuario && usuario.activo && usuarioSocket.from === 'mendozarq') {
        client.join(String(usuario.rol));
      }

      if (usuario && usuario.activo && usuarioSocket.from === 'liraki') {
        client.join(String(usuario.uuid));
      }
    } catch (error) {
      return new Error(error as string);
    }
  });
};

export const joinPedidos = (client: Socket, io: socketIO.Server) => {
  client.on('ws:pedidos', async (token: string) => {
    try {
      if (!token) {
        return new Error('Por favor ingrese el token porfavor!');
      }

      const { uuid }: TokenUsuario = <any>jwt.verify(token, config.jwtSecret);
      const conn: Pool = await connect();
      const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM usuario WHERE uuid = ?', [uuid]);

      const usuario: Usuario = row;
      if (usuario && usuario.activo) {
        client.join(String(usuario.rol));
      } else {
        client.join('ninguno' as Roles);
      }
    } catch (error) {
      return new Error(error as string);
    }
  });
};

export const disconnect = (client: Socket) => {
  client.on('disconnect', () => {
    console.log(`📕 ws: Client ${client.id} disconnected`);
  });
};

// Escuchar mensajes
export const mensaje = (client: Socket, io: socketIO.Server) => {
  client.on('mensaje', (payload: { de: string; cuerpo: string }) => {
    console.log('mensaje recibido', payload);

    io.to('administrador' as Roles).emit('mensaje-nuevo', payload);
  });
};
