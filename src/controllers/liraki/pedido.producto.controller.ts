import { Request, Response } from 'express';
import { PedidoProducto } from '../../models/liraki/pedido.producto.interface';
import { connect } from './../../classes/database';
import { v4 as uuid } from 'uuid';
import { Pool } from 'mysql2/promise';

export const addPedidoProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const pedidoProducto: PedidoProducto = req.body;

    if (!pedidoProducto.uuidCliente || !pedidoProducto.nitCI) {
      return res.status(400).json({
        message: 'No se ha podido realizar el pedido, ocurrio un problema con el producto o el usuario. 🙁',
      });
    }
    pedidoProducto.uuid = uuid();

    await conn.query(`INSERT INTO pedidoProducto SET ?;`, [pedidoProducto]);

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
