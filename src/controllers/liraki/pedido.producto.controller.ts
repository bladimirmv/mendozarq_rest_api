import { ApiResponse } from './../../models/api/api.response.interface';
import { Request, Response } from 'express';
import { PedidoProducto } from '../../models/liraki/pedido.producto.interface';
import { connect } from './../../classes/database';
import { v4 as uuid } from 'uuid';
import { Pool, FieldPacket } from 'mysql2/promise';

export const addPedidoProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const pedidoProducto: PedidoProducto = req.body;
    const { carrito, ...pedido } = pedidoProducto;

    if (!pedido.uuidCliente || !pedido.nitCI) {
      return res.status(400).json({
        message: 'No se ha podido realizar el pedido, ocurrio un problema con el producto o el usuario. 🙁',
      });
    }

    const [pedidos]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM pedidoProducto AS pp WHERE pp.uuidCliente = ? && pp.estado = 'pendiente';`,
      [pedido.uuidCliente]
    );

    if (pedidos.length > 1) {
      return res.status(400).json({
        message:
          '🙁 Tienes pedidos por confirmar, por favor mantente al contacto con nosostros te enviaremos un mensaje para la confirmación de los mismos. ',
      });
    }

    pedido.uuid = uuid();
    await conn.query(`INSERT INTO pedidoProducto SET ?;`, [pedido]);

    return res.status(201).json({
      message: 'El pedido se ha agregado  correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
