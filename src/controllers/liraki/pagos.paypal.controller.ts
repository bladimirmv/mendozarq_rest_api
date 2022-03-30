import { VentaProducto, ConceptoVenta, Venta } from './../../models/liraki/venta.producto.interface';
import { Pool, FieldPacket } from 'mysql2/promise';
import { Request, Response } from 'express';
import { CLIENT_URL, HOST_API, PAYPAL_API, PAYPAL_API_CLIENT, PAYPAL_API_SECRET } from './../../global/enviroment';
import axios from 'axios';
import { connect } from '../../classes/database';
import { v4 as uuid } from 'uuid';

export const createOrder = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const ventaView: VentaProducto = req.body;
    const { conceptos, ...venta } = ventaView;
    let mRows: any[] = [];

    if (!venta.uuidCliente) {
      return res.status(400).json({
        message: 'No se ha podido realizar el pedido, ocurrio un problema con el producto o el usuario. 🙁',
      });
    }

    const [pedidos]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM venta AS pp WHERE pp.uuidCliente = ? && pp.estado = 'pendiente';`,
      [venta.uuidCliente]
    );

    if (pedidos.length > 1) {
      return res.status(400).json({
        message:
          '🙁 Tienes pedidos por confirmar, por favor mantente al contacto con nosostros te enviaremos un mensaje para la confirmación de los mismos. ',
      });
    }

    venta.estado = 'pagando';
    venta.tipoVenta = 'online';

    venta.uuid = uuid();
    await conn.query(`INSERT INTO venta SET ?;`, [venta]);

    conceptos.forEach((ct) => {
      mRows.push(
        Object.values({
          uuid: uuid(),
          cantidad: ct.cantidad,
          precioUnitario: ct.precioUnitario,
          descuento: ct.descuento,
          importe: ct.importe,
          uuidProducto: ct.uuidProducto,
          uuidVenta: venta.uuid,
        } as ConceptoVenta)
      );
    });

    await conn.query(
      `INSERT  INTO conceptoVenta(uuid, cantidad, precioUnitario, descuento, importe, uuidProducto, uuidVenta) VALUES ?;`,
      [mRows]
    );

    let productos: any[] = [];

    const order = {
      intent: 'CAPTURE',
      purchase_units: [
        {
          amount: {
            currency_code: 'USD',
            value: (Number(venta.total) / 7).toFixed(2),
          },
          description: `Pedido de productos a la Carpinteria Liraki por parte de ${venta.uuidCliente}`,
        },
      ],
      application_context: {
        brand_name: 'Carpinteria LIRAKI',
        landing_page: 'LOGIN',
        user_action: 'PAY_NOW',
        return_url: `${HOST_API}/api/paypal/capture-order/${venta.uuidCliente}`,
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
  try {
    const { token } = req.query;
    const uuid = req.params.uuid;
    let venta: Venta = {} as Venta;

    const conn: Pool = await connect();

    const [[venta_row]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM venta AS v WHERE v.uuidCliente = ? && v.estado = 'pagando' ;`,
      [uuid]
    );

    venta = venta_row as VentaProducto;
    venta.estado = 'pendiente';

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

    await conn.query(`UPDATE venta SET ? WHERE uuid = ?`, [venta, venta.uuid]);
    await conn.query(`DELETE FROM carritoProducto WHERE uuidCliente = ?`, [uuid]);

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
