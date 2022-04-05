import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';
import { VisitaProyecto } from './../../models/mendozarq/visita.proyecto.interface';

// ====================> addVisitaProyecto
export const addVisitaProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const visitaProyecto: VisitaProyecto = req.body;

    if (!visitaProyecto.nombre) {
      return res.status(400).json({
        message: 'No se ha podido registrar, por favor ingrese los datos de la visita. 🙁',
      });
    }

    visitaProyecto.uuid = uuid();

    await conn.query('INSERT INTO visitaProyecto SET ?', [visitaProyecto]);

    return res.status(201).json({
      message: 'Visita creado exitosamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> getOneVisitaProyecto
export const getOneVisitaProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[visitaProyecto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM visitaProyecto WHERE uuid = ?', [
      uuid,
    ]);

    return visitaProyecto
      ? res.status(200).json(visitaProyecto)
      : res.status(404).json({ message: 'No se encontro la visita. 🙁' });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> getAllVisitaProyecto
export const getAllVisitaProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [visitaProyecto]: [any[], FieldPacket[]] = await conn.query(
      'SELECT * FROM visitaProyecto WHERE uuidProyecto = ? ORDER BY creadoEn DESC',
      [uuid]
    );

    return res.status(200).json(visitaProyecto);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> updateVisitaProyecto
export const updateVisitaProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    const visitaProyecto: VisitaProyecto = req.body;

    const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM visitaProyecto WHERE uuid = ?', [uuid]);

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo actualizar la visita, por que no existe. 🙁',
      });
    }

    await conn.query('UPDATE visitaProyecto SET ? WHERE uuid = ?', [visitaProyecto, uuid]);

    return res.status(200).json({
      message: 'Visita actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================> deleteVisitaProyecto
export const deleteVisitaProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM visitaProyecto WHERE uuid = ?', [uuid]);

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo eliminar la visita, por que no existe. 🙁',
      });
    }

    await conn.query('DELETE FROM visitaProyecto WHERE uuid = ?', [uuid]);

    return res.status(200).json({
      message: 'Visita eliminado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const getAllTareasByProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [tareas]: [any[], FieldPacket[]] = await conn.query(
      `SELECT tp.* FROM tareaPlanificacionProyecto AS tp
			INNER JOIN capituloPlanificacionproyecto c on tp.uuidCapitulo = c.uuid
			INNER JOIN planificacionProyecto pp on c.uuidPlanificacionProyecto = pp.uuid
			WHERE pp.uuidProyecto = ?;`,
      [uuid]
    );

    res.status(200).json(tareas);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
