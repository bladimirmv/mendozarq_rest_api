import { Producto } from './../../models/liraki/producto.interface';
import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';
import {
  CarritoProducto,
  CarritoProductoView,
  CarritoProductoInline,
} from './../../models/liraki/carrito.producto.interface';

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

    const [carrito]: [any[], FieldPacket[]] = await conn.query(
      `SELECT  * FROM carritoProducto WHERE uuidCliente = ? AND uuidProducto = ?;`,
      [CarritoProducto.uuidCliente, CarritoProducto.uuidProducto]
    );

    if (carrito.length >= 1) {
      console.log('si hay xd');

      await conn.query(
        `
      UPDATE carritoProducto SET cantidad = cantidad + 1 WHERE uuidProducto= ? AND  uuidCliente = ?;`,
        [CarritoProducto.uuidProducto, CarritoProducto.uuidCliente]
      );

      return res.status(201).json({
        message: 'Se ha agregado al carrito exitosamente! 😀',
      });
    }

    await conn.query(`INSERT INTO carritoProducto SET ? ;`, [CarritoProducto]);

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
    let carrito: CarritoProductoView[];
    let carritoProducto: CarritoProductoInline[];

    const [rows]: [any[], FieldPacket[]] = await conn.query(
      `SELECT  fp.keyName, p.*, cp.uuid as uuidCP, cp.creadoEn as creadoEnCP, cp.uuidProducto, cp.uuidCliente, cp.cantidad
      FROM carritoProducto AS cp
               INNER JOIN producto p on cp.uuidProducto = p.uuid
               INNER JOIN fotoProducto fp on p.uuid = fp.uuidProducto
      WHERE cp.uuidCliente = ?
and fp.indice = ( SELECT MIN(ffpp.indice) FROM fotoProducto as ffpp where ffpp.uuidProducto = p.uuid )
      ORDER BY cp.creadoEn DESC;`,
      [uuid]
    );
    carritoProducto = rows as CarritoProductoInline[];

    carrito = carritoProducto.map((carrito) => {
      let data: CarritoProductoView;
      const { uuidCP, creadoEnCP, uuidProducto, uuidCliente, cantidad, ...producto } = carrito;
      data = {
        uuid: uuidCP,
        creadoEn: creadoEnCP,
        uuidProducto,
        uuidCliente,
        cantidad,
        producto,
      };
      return data;
    });

    res.status(200).json(carrito);
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

    const [CarritoProducto]: [any[], FieldPacket[]] = await conn.query(
      'SELECT * FROM carritoProducto WHERE uuidCliente = ?',
      [uuid]
    );

    if (!CarritoProducto) {
      return res.status(404).json({
        message: 'No se pudo eliminar el producto del carrito, por que no existe. 🙁',
      });
    }

    await conn.query('DELETE FROM carritoProducto WHERE uuidCliente = ?', [uuid]);
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

// ====================> deleteCarritoProducto
export const deleteProductoFromCarrito = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [CarritoProducto]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM carritoProducto WHERE uuid = ?', [
      uuid,
    ]);

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
