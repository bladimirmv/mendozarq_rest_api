import { CarritoProductoView } from './../../models/liraki/carrito.producto.interface';
import { CarritoPedido } from './../../models/liraki/pedido.producto.interface';
// import { pedidoProductoPaypal } from './pagos.paypal.controller';
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
    let mRows: any[] = [];

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

    carrito.forEach((ca) => {
      mRows.push(
        Object.values({
          uuid: uuid(),
          cantidad: ca.cantidad,
          uuidProducto: ca.uuidProducto,
          uuidPedido: pedido.uuid,
          precio: ca.producto.precio,
          descuento: ca.producto.descuento,
          nombre: ca.producto.nombre,
          descripcion: ca.producto.descripcion,
        } as CarritoPedido)
      );
    });

    await conn.query(
      `INSERT  INTO carritoPedido(uuid, cantidad, uuidProducto, uuidPedido, precio, descuento, nombre, descripcion) VALUES ?;`,
      [mRows]
    );

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

export const getOnePedido = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    let pedidoProducto: PedidoProducto[];

    const [pedidos]: [any[], FieldPacket[]] = await conn.query(
      `SELECT pp.* FROM pedidoProducto AS pp WHERE PP.uuidCliente = ? ORDER BY pp.creadoEn DESC;;`,
      [uuid]
    );

    const [carrito]: [any[], FieldPacket[]] = await conn.query(
      `SELECT cp.* FROM pedidoProducto AS pp
      INNER JOIN carritoPedido cp on pp.uuid = cp.uuidPedido
      WHERE PP.uuidCliente = ? ORDER BY cp.creadoEn DESC;`,
      [uuid]
    );

    pedidoProducto = pedidos as PedidoProducto[];

    pedidoProducto.forEach((pedido) => {
      pedido.carrito = carrito.filter((cart: CarritoPedido) => cart.uuidPedido === pedido.uuid);
    });

    return res.status(200).json(pedidoProducto);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
