import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';
import { CarritoProducto } from './../../models/liraki/carrito.producto.interface';

// ====================> addCarritoProducto
export const addCarritoProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const CarritoProducto: CarritoProducto = req.body;
    if (!CarritoProducto.uuidCliente || !CarritoProducto.uuidProducto) {
      return res.status(400).json({
        message: 'No se ha podido agregar al carrito, ocurrio un problema con el producto o el usuario. 🙁',
      });
    }
    CarritoProducto.uuid = uuid();

    await conn.query('INSERT INTO carritoProducto SET ?', [CarritoProducto]);

    return res.status(201).json({
      message: 'Se ha agregado al carrito exitosamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> getOneCarritoProducto
export const getCarritoProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [CarritoProducto]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM carritoProducto AS cp
			INNER JOIN producto p on cp.uuidProducto = p.uuid
			WHERE  cp.uuidCliente = ? ORDER BY cp.creadoEn DESC;`,
      [uuid]
    );

    res.status(200).json(CarritoProducto);
    // return CarritoProducto
    //   ? res.status(200).json(CarritoProducto)
    //   : res.status(404).json({
    //       message: 'No se encontro el ningun producto en el carrito. 🙁',
    //     });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> getAllCarritoProducto
export const getAllCarritoProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();

    const [CarritoProducto]: [any[], FieldPacket[]] = await conn.query(
      'SELECT * FROM CarritoProducto ORDER BY creadoEn DESC'
    );

    return res.status(200).json(CarritoProducto);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> updateCarritoProducto
export const updateCarritoProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    const CarritoProducto: CarritoProducto = req.body;

    const [[CarritoProductoFound]]: [any[], FieldPacket[]] = await conn.query(
      'SELECT * FROM carritoProducto WHERE uuid = ?',
      [uuid]
    );

    if (!CarritoProductoFound) {
      return res.status(404).json({
        message: 'No se pudo actualizar la cantidad, ocurrio un error con ptoducto 🙁',
      });
    }

    await conn.query('UPDATE carritoProducto SET ? WHERE uuid = ?', [CarritoProducto, uuid]);

    return res.status(200).json({
      message: 'Cantidad actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> deleteCarritoProducto
export const deleteCarritoProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[CarritoProducto]]: [any[], FieldPacket[]] = await conn.query(
      'SELECT * FROM carritoProducto WHERE uuid = ?',
      [uuid]
    );

    if (!CarritoProducto) {
      return res.status(404).json({
        message: 'No se pudo eliminar el producto del carrito, por que no existe. 🙁',
      });
    }

    await conn.query('DELETE FROM carritoProducto WHERE uuid = ?', [uuid]);
    return res.status(200).json({
      message: 'Producto eliminado correctamente del carrito. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
