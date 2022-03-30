import { Request, Response } from 'express';
import { Pool } from 'mysql2/promise';
import { connect } from '../../classes/database';
import { OpinionProducto, OpinionProductoView } from '../../models/liraki/opinion.producto.interface';
import { v4 as uuid } from 'uuid';
import { FieldPacket } from 'mysql';

export const addOpinionProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const opinion: OpinionProducto = req.body;
    let pendientes: OpinionProducto[];
    if (!opinion.titulo || !opinion.descripcion || !opinion.uuidCliente || !opinion.uuidProducto) {
      return res.status(400).json({
        message: `No se ha podido registrar, por favor ingrese los datos del opinion. 🙁`,
      });
    }

    const [opiniones]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM opinionProducto as op WHERE op.uuidCliente = ?;`,
      [opinion.uuidCliente]
    );

    pendientes = opiniones as OpinionProducto[];
    pendientes = pendientes.filter((op) => op.estado === 0);

    if (pendientes.length >= 2) {
      return res.status(400).json({
        message: `No se ha podido registrar, has llegado al limite de opiniones pendientes. 🙁`,
      });
    }

    opinion.uuid = uuid();

    await conn.query(`INSERT INTO opinionProducto SET ? `, [opinion]);

    return res.status(201).json({
      message: 'Opinion creado exitosamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const getAllOpinionProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    let opninionView: OpinionProductoView[] = [] as OpinionProductoView[];

    const [opiniones]: [any[], FieldPacket[]] = await conn.query(
      `SELECT op.*, concat_ws(' ', u.nombre, u.apellidoPaterno, u.apellidoMaterno) AS cliente, p.nombre AS nombreProducto  FROM opinionProducto AS op
      INNER JOIN usuario u on op.uuidCliente = u.uuid
      INNER JOIN producto p on op.uuidProducto = p.uuid
      ORDER BY op.creadoEn DESC;`
    );

    opninionView = opiniones as OpinionProductoView[];

    return res.status(200).json(opninionView);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const getAllOpinionProductoByUuid = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    let opninionView: OpinionProductoView[] = [] as OpinionProductoView[];

    const [opiniones]: [any[], FieldPacket[]] = await conn.query(
      `SELECT op.*, concat_ws(' ', u.nombre, u.apellidoPaterno, u.apellidoMaterno) AS cliente, p.nombre AS nombreProducto  FROM opinionProducto AS op
      INNER JOIN usuario u on op.uuidCliente = u.uuid
      INNER JOIN producto p on op.uuidProducto = p.uuid
      WHERE op.uuidProducto = ? AND op.estado = 1 ORDER BY op.creadoEn DESC;`,
      [uuid]
    );

    opninionView = opiniones as OpinionProductoView[];

    return res.status(200).json(opninionView);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const deleteOpinionProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[row]]: [any[], FieldPacket[]] = await conn.query(`SELECT * FROM opinionProducto WHERE uuid = ?`, [uuid]);

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo eliminar el opinion, por que no existe. 🙁',
      });
    }

    await conn.query(`DELETE FROM opinionProducto WHERE uuid = ?`, [uuid]);

    return res.status(200).json({
      message: 'Opinion eliminado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const updateOpinion = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    const opinion: OpinionProductoView = req.body;

    const [[row]]: [any[], FieldPacket[]] = await conn.query(`SELECT * FROM opinionProducto WHERE uuid = ?`, [uuid]);

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo actualizar la opinion, por que no existe. 🙁',
      });
    }

    await conn.query(`UPDATE opinionProducto SET ? WHERE uuid = ?`, [opinion, uuid]);

    return res.status(200).json({
      message: 'Opinion actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
