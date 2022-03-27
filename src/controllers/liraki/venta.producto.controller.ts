import {
  VentaView,
  ConceptoVenta,
  ConceptoVentaView,
  VentaProducto,
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

    return res.status(200).json({
      message: 'Producto actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
