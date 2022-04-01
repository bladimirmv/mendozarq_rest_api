import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';
import { Proveedor } from './../../models/mendoraki/proveedor.interface';

// ====================> addProveedor
export const addProveedor = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const proveedor: Proveedor = req.body;
    if (!proveedor.nombre) {
      return res.status(400).json({
        message: 'No se ha podido registrar, por favor ingrese los datos del proveedor. 🙁',
      });
    }
    proveedor.uuid = uuid();

    await conn.query('INSERT INTO proveedor SET ?', [proveedor]);

    return res.status(201).json({
      message: 'Proveedor creado exitosamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> getOneProveedor
export const getOneProveedor = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[proveedor]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM proveedor WHERE uuid = ?', [uuid]);

    return proveedor
      ? res.status(200).json(proveedor)
      : res.status(404).json({
          message: 'No se encontro el proveedor. 🙁',
        });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> getAllProveedor
export const getAllProveedor = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();

    const [proveedor]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM proveedor ORDER BY creadoEn DESC');

    return res.status(200).json(proveedor);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> updateProveedor
export const updateProveedor = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    const proveedor: Proveedor = req.body;

    const [[proveedorFound]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM proveedor WHERE uuid = ?', [
      uuid,
    ]);

    if (!proveedorFound) {
      return res.status(404).json({
        message: 'No se pudo actualizar el proveedor, por que no existe. 🙁',
      });
    }

    await conn.query('UPDATE proveedor SET ? WHERE uuid = ?', [proveedor, uuid]);

    return res.status(200).json({
      message: 'Proveedor actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> deleteProveedor
export const deleteProveedor = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[proveedor]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM proveedor WHERE uuid = ?', [uuid]);

    if (!proveedor) {
      return res.status(404).json({
        message: 'No se pudo eliminar el proveedor, por que no existe. 🙁',
      });
    }

    await conn.query('DELETE FROM proveedor WHERE uuid = ?', [uuid]);
    return res.status(200).json({
      message: 'Proveedor eliminado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
