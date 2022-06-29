import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';
import { emitAllLogs } from '../logs/logs.controller';

import { connect } from './../../classes/database';
import { Personal } from './../../models/mendozarq/personal.interface';

// ====================> addPersonal
export const addPersonal = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const personal: Personal = req.body;
    if (!personal.nombre) {
      return res.status(400).json({
        message: 'No se ha podido registrar, por favor ingrese los datos del personal. 🙁',
      });
    }
    personal.uuid = uuid();

    await conn.query('INSERT INTO personal SET ?', [personal]);

    emitAllLogs();

    return res.status(201).json({
      message: 'Personal creado exitosamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> getOnePersonal
export const getOnePersonal = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[personal]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM personal WHERE uuid = ?', [uuid]);

    return personal
      ? res.status(200).json(personal)
      : res.status(404).json({
          message: 'No se encontro el personal. 🙁',
        });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> getAllPersonal
export const getAllPersonal = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();

    const [personal]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM personal ORDER BY creadoEn DESC');

    return res.status(200).json(personal);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> updatePersonal
export const updatePersonal = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    const personal: Personal = req.body;

    const [[personalFound]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM personal WHERE uuid = ?', [uuid]);

    if (!personalFound) {
      return res.status(404).json({
        message: 'No se pudo actualizar el personal, por que no existe. 🙁',
      });
    }

    emitAllLogs();

    await conn.query('UPDATE personal SET ? WHERE uuid = ?', [personal, uuid]);

    return res.status(200).json({
      message: 'Personal actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> deletePersonal
export const deletePersonal = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[personal]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM personal WHERE uuid = ?', [uuid]);

    if (!personal) {
      return res.status(404).json({
        message: 'No se pudo eliminar el personal, por que no existe. 🙁',
      });
    }

    emitAllLogs();

    await conn.query('DELETE FROM personal WHERE uuid = ?', [uuid]);
    return res.status(200).json({
      message: 'Personal eliminado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
