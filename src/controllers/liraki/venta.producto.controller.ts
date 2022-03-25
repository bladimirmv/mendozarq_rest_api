import { Venta, VentaView, ConceptoVenta, ConceptoVentaView } from './../../models/liraki/venta.producto.interface';
import { Pool, FieldPacket } from 'mysql2/promise';
import { Request, Response } from 'express';
import { connect } from '../../classes/database';

// export const getAllVentaFisica = async (req: Request, res: Response) => {
//   const conn: Pool = await connect();
//   try {
//     await conn.query('START TRANSACTION');

//     await conn.query('COMMIT');
//   } catch (error) {
//     await conn.query('ROLLBACK');
//     console.log('❌Ocurrio un error:', error);
//     return res.status(400).json({
//       message: error,
//     });
//   }
// };

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
			WHERE v.tipoVenta = 'fisica'
			ORDER BY v.creadoEn DESC;`
    );
    const [conceptos_rows]: [any[], FieldPacket[]] = await conn.query(
      `SELECT cv.*, p.nombre as nombre
			FROM venta AS v
							 INNER JOIN conceptoVenta cv on v.uuid = cv.uuidVenta
			INNER JOIN producto p on cv.uuidProducto = p.uuid
			WHERE v.tipoVenta = 'fisica'
			ORDER BY cv.creadoEn DESC;`
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
