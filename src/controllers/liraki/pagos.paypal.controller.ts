import { Pool, FieldPacket } from 'mysql2/promise';
import { PedidoProducto } from './../../models/liraki/pedido.producto.interface';
import { Request, Response } from 'express';
import { CLIENT_URL, HOST_API, PAYPAL_API, PAYPAL_API_CLIENT, PAYPAL_API_SECRET } from './../../global/enviroment';
import axios from 'axios';
import { connect } from '../../classes/database';
import { v4 as uuid } from 'uuid';

export const createOrder = async (req: Request, res: Response) => {
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

    pedido.estado = 'pagando';

    pedido.uuid = uuid();
    await conn.query(`INSERT INTO pedidoProducto SET ?;`, [pedido]);

    let productos: any[] = [];

    pedidoProducto.carrito.forEach((carrito) => {
      productos.push({
        amount: {
          currency_code: 'USD',
          value: carrito.producto.precio,
        },
        description: carrito.producto.descripcion,
      });
    });

    const order = {
      intent: 'CAPTURE',
      purchase_units: [
        {
          amount: {
            currency_code: 'USD',
            value: (pedido.total / 7).toFixed(2),
          },
          description: 'Pedido de productos  a la Carpinteria Liraki',
        },
      ],
      application_context: {
        brand_name: 'Carpinteria LIRAKI',
        landing_page: 'LOGIN',
        user_action: 'PAY_NOW',
        return_url: `${HOST_API}/api/paypal/capture-order/${pedido.uuid}`,
        cancel_url: `${CLIENT_URL}`,
      },
    };

    // format the body
    const params = new URLSearchParams();
    params.append('grant_type', 'client_credentials');

    // Generate an access token
    const {
      data: { access_token },
    } = await axios.post('https://api-m.sandbox.paypal.com/v1/oauth2/token', params, {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      auth: {
        username: PAYPAL_API_CLIENT,
        password: PAYPAL_API_SECRET,
      },
    });

    // make a request
    const response = await axios.post(`${PAYPAL_API}/v2/checkout/orders`, order, {
      headers: {
        Authorization: `Bearer ${access_token}`,
      },
    });

    return res.status(200).json(response.data);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(500).json({
      message: error,
    });
  }
};

export const captureOrder = async (req: Request, res: Response) => {
  const { token } = req.query;

  const uuidPedido = req.params.uuid;
  let pedidoProducto: PedidoProducto = {} as PedidoProducto;

  const conn: Pool = await connect();

  const [[pedido]]: [any[], FieldPacket[]] = await conn.query(`SELECT * FROM pedidoProducto AS pp WHERE pp.uuid = ?;`, [
    uuidPedido,
  ]);
  pedidoProducto = pedido as PedidoProducto;
  pedidoProducto.estado = 'pendiente';

  try {
    const response = await axios.post(
      `${PAYPAL_API}/v2/checkout/orders/${token}/capture`,
      {},
      {
        auth: {
          username: PAYPAL_API_CLIENT,
          password: PAYPAL_API_SECRET,
        },
      }
    );

    await conn.query(`UPDATE pedidoProducto SET ? WHERE uuid = ?`, [pedidoProducto, uuidPedido]);

    res.redirect(`${CLIENT_URL}/profile`);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(500).json({
      message: error,
    });
  }
};

export const cancelOrder = (req: Request, res: Response) => {
  res.redirect(`${CLIENT_URL}/`);
};
