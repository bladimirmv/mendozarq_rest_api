import { emitVentas, emitVentasOnline } from './../logs/logs.controller';
import {
  VentaView,
  ConceptoVenta,
  ConceptoVentaView,
  VentaProducto,
  Venta,
} from './../../models/liraki/venta.producto.interface';
import { Pool, FieldPacket } from 'mysql2/promise';
import { Request, Response } from 'express';
import { connect } from '../../classes/database';
import { v4 as uuid } from 'uuid';

export const addVentaFisica = async (req: Request, res: Response) => {
  const conn: Pool = await connect();
  const ventaView: VentaProducto = req.body;
  const { conceptos, ...venta } = ventaView;
  let mRows: any[] = [];
  try {
    if (!venta.uuidCliente || !venta.uuidVendedor) {
      return res.status(400).json({
        message: 'No se ha podido realizar el pedido, ocurrio un problema con el producto o el usuario. 🙁',
      });
    }

    venta.estado = venta.tipoEnvio === 'personal' ? 'para_recoger' : 'confirmado';

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

    emitVentas(venta.uuidCliente);

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

export const getAllVentaFisica = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    let ventas: VentaView[] = [];
    let conceptos: ConceptoVentaView[] = [];

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

    return res.status(200).json(ventas);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const updateVenta = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuidVenta: string = req.params.uuid;
    const { conceptos, ...venta }: VentaView = req.body;
    let mRows: any[] = [];

    const [[row]]: [any[], FieldPacket[]] = await conn.query(`SELECT * FROM venta WHERE uuid = ?`, [uuidVenta]);

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo actualizar el producto, por que no existe. 🙁',
      });
    }

    venta.estado =
      (venta.tipoEnvio === 'delivery' && venta.estado === 'para_recoger') ||
      (venta.tipoEnvio === 'personal' && venta.estado === 'en_envio')
        ? 'confirmado'
        : venta.estado;

    conceptos.forEach((ct) => {
      mRows.push(
        Object.values({
          uuid: ct.uuid ? ct.uuid : uuid(),
          cantidad: ct.cantidad,
          precioUnitario: ct.precioUnitario,
          descuento: ct.descuento,
          importe: ct.importe,
          uuidProducto: ct.uuidProducto,
          uuidVenta: venta.uuid,
        } as ConceptoVenta)
      );
    });
    await conn.query(`UPDATE venta SET ? WHERE uuid = ?`, [venta, uuidVenta]);

    await conn.query(`DELETE FROM conceptoVenta WHERE uuidVenta = ?`, [uuidVenta]);

    await conn.query(
      `INSERT INTO conceptoVenta(uuid, cantidad, precioUnitario, descuento, importe, uuidProducto, uuidVenta) VALUES ?;`,
      [mRows]
    );

    if (venta.tipoVenta === 'fisica') {
      emitVentas(venta.uuidCliente);
    }

    if (venta.tipoVenta === 'online') {
      emitVentasOnline(venta.uuidCliente);
    }

    return res.status(200).json({
      message: 'Venta actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const updateEstadoVenta = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuidVenta: string = req.params.uuid;
    const { estado, uuidCliente, tipoVenta }: VentaView = req.body;

    const [[row]]: [any[], FieldPacket[]] = await conn.query(`SELECT * FROM venta WHERE uuid = ?`, [uuidVenta]);

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo actualizar el producto, por que no existe. 🙁',
      });
    }

    await conn.query(`UPDATE venta SET ? WHERE uuid = ?`, [{ estado }, uuidVenta]);

    if (tipoVenta === 'fisica') {
      emitVentas(uuidCliente);
    }

    if (tipoVenta === 'online') {
      emitVentasOnline(uuidCliente);
    }

    return res.status(200).json({
      message: 'Estado actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
export const deleteVenta = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    let venta: Venta = {} as Venta;

    const [[row]]: [any[], FieldPacket[]] = await conn.query(`SELECT * FROM venta WHERE uuid = ?`, [uuid]);

    venta = row as Venta;

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo eliminar, por que no existe. 🙁',
      });
    }

    await conn.query('DELETE FROM venta WHERE uuid = ?', [uuid]);

    if (venta.tipoVenta === 'fisica') {
      emitVentas(venta.uuidCliente);
    }

    if (venta.tipoVenta === 'online') {
      emitVentasOnline(venta.uuidCliente);
    }

    return res.status(200).json({
      message: 'Producto eliminado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// *vetans online

export const addVentaOnline = async (req: Request, res: Response) => {
  const conn: Pool = await connect();
  const ventaView: VentaProducto = req.body;
  const { conceptos, ...venta } = ventaView;
  let mRows: any[] = [];
  try {
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

    venta.estado = 'pendiente';
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

    emitVentasOnline(venta.uuidCliente);

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
