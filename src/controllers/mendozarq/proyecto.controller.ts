import { Pool } from 'mysql2/promise';
import { Response, Request } from 'express';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';

import { Proyecto } from './../../models/mendozarq/proyecto.interface';
import { FieldPacket, QueryError } from 'mysql2';
import { emitAllLogs } from '../logs/logs.controller';
import { Roles } from './../../models/auth/usuario.interface';

// ====================> addProyecto
export async function addProyecto(req: Request, res: Response) {
  try {
    const conn: Pool = await connect();
    const proyecto: Proyecto = req.body;

    if (!proyecto.nombre && proyecto.uuidCliente) {
      return res.status(400).json({
        message: 'No se ha podido registrar, por favor los datos del proyecto',
      });
    }

    proyecto.uuid = uuid();

    await conn.query('INSERT INTO proyecto SET ?', [proyecto]);

    emitAllLogs();

    return res.status(201).json({
      message: 'Proyecto creado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌ Ocurrio un error: ', error);
    return res.status(400).json({
      message: error,
    });
  }
}

// ====================> getOneProyecto
export async function getOneProyecto(req: Request, res: Response) {
  try {
    const conn: Pool = await connect();
    const uuid = req.params.uuid;

    const [[proyecto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM proyectoWiew WHERE uuid = ?', [uuid]);

    return proyecto
      ? res.status(200).json(proyecto)
      : res.status(404).json({
          message: 'No se encontro el proyecto. 🙁',
        });
  } catch (error) {
    console.log('❌ Ocurrio un error: ', error);
    return res.status(400).json({
      message: error,
    });
  }
}

// ====================> getAllProyecto
export async function getAllProyecto(req: Request, res: Response) {
  try {
    const conn: Pool = await connect();
    let proyectos;

    switch (<Roles>res.locals.rol) {
      case 'administrador':
        const [proyectos_row]: [any[], FieldPacket[]] = await conn.query(
          'SELECT * FROM proyectoWiew ORDER BY creadoEn DESC'
        );
        proyectos = proyectos_row;
        break;

      case 'arquitecto':
        const [proyectos_custom_row]: [any[], FieldPacket[]] = await conn.query(
          'SELECT * FROM proyectoWiew ORDER BY creadoEn DESC'
        );
        proyectos = proyectos_custom_row;
        break;

      default:
        break;
    }

    return res.status(200).json(proyectos);
  } catch (error) {
    console.log('❌ Ocurrio un error: ', error);
    return res.status(400).json({
      message: error,
    });
  }
}

// ====================> updateProyecto

export async function updateProyecto(req: Request, res: Response) {
  try {
    const conn: Pool = await connect();
    const uuid = req.params.uuid;
    const proyecto: Proyecto = req.body;

    const [[proyectoFound]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM proyecto WHERE uuid = ?', [uuid]);

    if (!proyectoFound) {
      res.status(400).json({
        message: 'No se pudo actulizar el proyecto, por que no existe. 🙁',
      });
    }

    await conn.query('UPDATE proyecto SET ? WHERE uuid = ?', [proyecto, uuid]);
    emitAllLogs();

    res.status(200).json({
      message: 'Proyecto actulizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌ Ocurrio un error: ', error);
    return res.status(400).json({
      message: error,
    });
  }
}

// ====================> deleteProyecto
export async function deleteProyecto(req: Request, res: Response) {
  try {
    const uuid = req.params.uuid;
    const conn = await connect();

    const [[proyectoFound]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM proyecto WHERE uuid = ?', [uuid]);

    if (!proyectoFound) {
      res.status(400).json({
        message: 'No se pudo actulizar el proyecto, por que no existe. 🙁',
      });
    }

    await conn.query('DELETE FROM proyecto WHERE uuid = ?', [uuid]);
    emitAllLogs();

    return res.json({
      message: 'Proyecto eliminado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌ Ocurrio un error: ', error);
    return res.status(400).json({
      message: error,
    });
  }
}
