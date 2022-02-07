import {
  PlanificacionProyecto,
  PlanificacionProyectoView,
  TareaPlanificacionProyecto,
  CapituloPlanificacionProyecto,
} from './../../models/mendozarq/planificacion.interface';
import { Request, Response } from 'express';
import { Pool, FieldPacket } from 'mysql2/promise';
import { connect } from '../../classes/database';
import { v4 as uuid } from 'uuid';

export const addPlanificacionProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();

    const planificacionProyecto: PlanificacionProyecto = req.body;

    if (!planificacionProyecto.uuidProyecto) {
      return res.status(400).json({
        message: 'No se ha podido registrar, por favor ingrese los datos requeridos',
      });
    }

    planificacionProyecto.uuid = uuid();

    await conn.query(`INSERT INTO planificacionProyecto SET ? `, [planificacionProyecto]);
    res.status(201).json({
      message: 'Planificacion creado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const getPlanificacionProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    let planificacion: PlanificacionProyecto = {} as PlanificacionProyecto;

    const [[row]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM planificacionProyecto WHERE uuidProyecto = ?`,
      [uuid]
    );
    planificacion = row;
    res.status(201).json(planificacion);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const getAllPlanificacionProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    let planificacion: PlanificacionProyectoView = {} as PlanificacionProyectoView;

    const [[row_p]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM planificacionProyecto WHERE uuidProyecto = ? `,
      [uuid]
    );

    const [rows_cp]: [any[], FieldPacket[]] = await conn.query(
      `SELECT cp.*
      FROM capituloPlanificacionProyecto as cp
      INNER JOIN planificacionProyecto p ON p.uuid = cp.uuidPlanificacionProyecto
      WHERE p.uuidProyecto = ? ORDER BY cp.creadoEn;`,
      [uuid]
    );

    const [rows_tp]: [any[], FieldPacket[]] = await conn.query(
      `SELECT tp.*
      FROM tareaplanificacionproyecto AS tp
      INNER JOIN capituloPlanificacionProyecto cp ON cp.uuid = tp.uuidCapitulo
      INNER JOIN planificacionProyecto pp on cp.uuidPlanificacionProyecto = pp.uuid
      WHERE pp.uuidProyecto = ? ORDER BY tp.creadoEn;`,
      [uuid]
    );

    planificacion = row_p as PlanificacionProyectoView;
    planificacion.capitulos = rows_cp as CapituloPlanificacionProyecto[];
    planificacion.tareas = rows_tp as TareaPlanificacionProyecto[];

    res.status(201).json(planificacion);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const addTareaPlanificacionProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();

    const tareaPlanificacionProyecto: TareaPlanificacionProyecto = req.body;

    if (!tareaPlanificacionProyecto.uuidCapitulo) {
      return res.status(400).json({
        message: 'No se ha podido registrar, por favor ingrese los datos requeridos',
      });
    }

    tareaPlanificacionProyecto.uuid = uuid();

    await conn.query(`INSERT INTO tareaPlanificacionProyecto SET ? `, [tareaPlanificacionProyecto]);
    res.status(201).json({
      message: 'Tarea creado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const addCapituloPlanificacionProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();

    const tareaPlanificacionProyecto: TareaPlanificacionProyecto = req.body;

    if (!tareaPlanificacionProyecto.uuidCapitulo) {
      return res.status(400).json({
        message: 'No se ha podido registrar, por favor ingrese los datos requeridos',
      });
    }

    tareaPlanificacionProyecto.uuid = uuid();

    await conn.query(`INSERT INTO capituloPlanificacionProyecto SET ? `, [
      tareaPlanificacionProyecto,
    ]);
    res.status(201).json({
      message: 'Tarea creado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const deleteTareaPlanificacionProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    console.log('uuid: ', uuid);

    const [[row]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM tareaPlanificacionProyecto WHERE uuid = ?;`,
      [uuid]
    );
    const tareaPlanificion: TareaPlanificacionProyecto = row as TareaPlanificacionProyecto;

    if (!tareaPlanificion) {
      return res.status(404).json({
        message: 'No se pudo eliminar la tarea, por que no existe. 🙁',
      });
    }

    await conn.query(`DELETE FROM tareaPlanificacionProyecto WHERE uuid = ?;`, [uuid]);

    return res.status(200).json({
      message: 'Tarea eliminado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const deleteCapituloPlanificacionProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    console.log('uuid: ', uuid);

    const [[row]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM tareaPlanificacionProyecto WHERE uuid = ?;`,
      [uuid]
    );
    const tareaPlanificion: TareaPlanificacionProyecto = row as TareaPlanificacionProyecto;

    if (!tareaPlanificion) {
      return res.status(404).json({
        message: 'No se pudo eliminar la tarea, por que no existe. 🙁',
      });
    }

    await conn.query(`DELETE FROM capituloPlanificacionProyecto WHERE uuid = ?;`, [uuid]);

    return res.status(200).json({
      message: 'Tarea eliminado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
