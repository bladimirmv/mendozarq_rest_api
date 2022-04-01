import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';
import { Recurso } from './../../models/mendoraki/recurso.interface';

// ====================> addRecurso
export const addRecurso = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const recurso: Recurso = req.body;
    if (!recurso.nombre) {
      return res.status(400).json({
        message: 'No se ha podido registrar, por favor ingrese los datos del recurso. 🙁',
      });
    }
    recurso.uuid = uuid();

    await conn.query('INSERT INTO recurso SET ?', [recurso]);

    return res.status(201).json({
      message: 'Recurso creado exitosamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> getOneRecurso
export const getOneRecurso = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[recurso]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM recurso WHERE uuid = ?', [uuid]);

    return recurso
      ? res.status(200).json(recurso)
      : res.status(404).json({
          message: 'No se encontro el recurso. 🙁',
        });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> getAllRecurso
export const getAllRecurso = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();

    const [recurso]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM recurso ORDER BY creadoEn DESC');

    return res.status(200).json(recurso);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> updateRecurso
export const updateRecurso = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    const recurso: Recurso = req.body;

    const [[recursoFound]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM recurso WHERE uuid = ?', [uuid]);

    if (!recursoFound) {
      return res.status(404).json({
        message: 'No se pudo actualizar el recurso, por que no existe. 🙁',
      });
    }

    await conn.query('UPDATE recurso SET ? WHERE uuid = ?', [recurso, uuid]);

    return res.status(200).json({
      message: 'Recurso actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> deleteRecurso
export const deleteRecurso = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[recurso]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM recurso WHERE uuid = ?', [uuid]);

    if (!recurso) {
      return res.status(404).json({
        message: 'No se pudo eliminar el recurso, por que no existe. 🙁',
      });
    }

    await conn.query('DELETE FROM recurso WHERE uuid = ?', [uuid]);
    return res.status(200).json({
      message: 'Recurso eliminado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
