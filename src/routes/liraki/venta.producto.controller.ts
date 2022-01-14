import { Request, Response } from 'express';
import { Pool } from 'mysql2/promise';
import { connect } from '../../classes/database';
import { VentaProducto, VentaView } from '../../models/liraki/venta.producto.interface';

export const addVentaProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const ventaProducto: VentaProducto = {} as VentaProducto;

    if (ventaProducto.uuidCliente) {
    }
  } catch (error) {
    console.log('❌ Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
