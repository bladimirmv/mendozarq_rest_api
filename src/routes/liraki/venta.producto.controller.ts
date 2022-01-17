import { Request, Response } from 'express';
import { Pool, FieldPacket } from 'mysql2/promise';
import { connect } from '../../classes/database';
import { v4 as uuid } from 'uuid';
import {
  DetalleVentaProducto,
  Venta,
  VentaProducto,
  VentaView,
} from '../../models/liraki/venta.producto.interface';

export const addVentaProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const ventaProducto: VentaProducto = req.body;
    let { detalleVenta, ...venta } = ventaProducto;
    let mRows: any[] = [];

    if (!ventaProducto.uuidCliente) {
      return res.status(400).json({
        mesaage: 'No se ha podido registrar, por favor ingrese los datos requeridos',
      });
    }

    venta.uuid = uuid();

    detalleVenta.map((detalle: DetalleVentaProducto) => {
      detalle.uuid = uuid();
      detalle.uuidVentaProducto = venta.uuid;
      return detalle;
    });

    detalleVenta.forEach((detalle) => {
      mRows.push(Object.values(detalle));
    });

    await conn.query(`INSERT INTO ventaProducto SET ?`, [venta]);

    await conn.query(
      `INSERT INTO detalleVentaProducto (uuid, uuidVentaProducto, uuidProducto,cantidad, precio) VALUES ?`,
      [mRows]
    );
  } catch (error) {
    console.log('❌ Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const getAllVentaProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    let ventaProducto: VentaView[] = [];

    const [venta]: [any[], FieldPacket[]] = await conn.query(
      `SELECT vp.*,
        CONCAT_WS(' ', cliente.nombre, cliente.apellidoPaterno, cliente.apellidoMaterno)    as cliente,
        CONCAT_WS(' ', vendedor.nombre, vendedor.apellidoPaterno, vendedor.apellidoMaterno) as vendedor
      FROM ventaProducto AS vp
              INNER JOIN usuario cliente on vp.uuidCliente = cliente.uuid
              INNER JOIN usuario vendedor on vp.uuidVendedor = vendedor.uuid
      ORDER BY vp.creadoEn DESC;`
    );

    const [detalle]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM detalleVentaProducto ORDER BY creadoEn DESC, uuidVentaProducto;`
    );

    venta.forEach((venta: VentaView) => {
      venta.detalleVenta = detalle.filter(
        (detalle: DetalleVentaProducto) => detalle.uuidVentaProducto == venta.uuid
      );
      ventaProducto.push(venta);
    });

    return res.status(200).json(ventaProducto);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const updateVentaProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    const ventaProducto: VentaProducto = req.body;

    let { detalleVenta, ...venta } = ventaProducto;
    let mRows: any[] = [];

    if (!ventaProducto.uuid || !ventaProducto.uuidCliente) {
      return res.status(400).json({
        mesaage: 'No se ha podido registrar, por favor ingrese los datos requeridos',
      });
    }

    const [[row]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM ventaProducto WHERE uuid=?`,
      [uuid]
    );

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo actualizar la foto, por que no existe. 🙁',
      });
    }

    detalleVenta.forEach((detalle) => {
      mRows.push(Object.values(detalle));
    });

    await conn.query(`UPDATE ventaProducto SET ? WHERE uuid = ?`, [venta, uuid]);

    await conn.query(
      `INSERT INTO detalleVentaProducto (uuid, uuidVentaProducto, uuidProducto,cantidad, precio) VALUES ? ON DUPLICATE KEY UPDATE`,
      [mRows]
    );

    return res.status(200).json({
      message: 'Venta actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌ Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const deleteVentaProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[row]]: [any[], FieldPacket[]] = await conn.query(
      'SELECT * FROM ventaProducto WHERE uuid = ? ',
      [uuid]
    );
    const venta: Venta = row as Venta;

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo eliminar la venta, por que no existe. 🙁',
      });
    }

    await conn.query('DELETE FROM ventaProducto WHERE uuid = ?', [uuid]);

    return res.status(200).json({
      message: 'Venta eliminado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
