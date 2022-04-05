import { deleteFile, uploadOneFile } from './../../classes/aws.s3';
import { FileResponse } from './../../models/fileResponse.interface';
import {
  ObservacionObra,
  ObservacionObraView,
  FotoObservacionObra,
} from './../../models/mendozarq/observacion.obra.interface';
import { Pool, FieldPacket } from 'mysql2/promise';
import { Request, Response } from 'express';
import { connect } from '../../classes/database';
import { v4 as uuid } from 'uuid';

export const addObservacion = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const observacion: ObservacionObra = req.body;

    observacion.uuid = uuid();

    await conn.query(`INSERT INTO observacionObra SET ?`, [observacion]);

    return res.status(201).json({
      message: 'Producto creado exitosamente! 😀',
      data: observacion,
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const getAllObservacionByVisita = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    let observaciones: ObservacionObraView[] = [];
    let fotos: FotoObservacionObra[] = [];

    const [observacion_rows]: [any[], FieldPacket[]] = await conn.query(
      `SELECT o.* FROM observacionObra AS o
			WHERE o.uuidVisita = ? ORDER BY o.creadoEn;`,
      [uuid]
    );

    const [fotos_rows]: [any[], FieldPacket[]] = await conn.query(
      `SELECT f.* FROM fotoObservacionObra AS f
			INNER JOIN observacionObra o on f.uuidObservacionObra = o.uuid
			WHERE o.uuidVisita = ? ORDER BY f.creadoEn;`,
      [uuid]
    );

    observaciones = observacion_rows;
    fotos = fotos_rows;
    observaciones.map((obs) => {
      obs.fotos = fotos.filter((f) => f.uuidObservacionObra === obs.uuid);
      return obs;
    });

    return res.status(200).json(observaciones);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const updateObservacion = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    const observacion: ObservacionObra = req.body;

    const [[row]]: [any[], FieldPacket[]] = await conn.query(`SELECT * FROM observacionObra WHERE uuid = ?`, [uuid]);

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo actualizar la observacion, por que no existe. 🙁',
      });
    }

    await conn.query(`UPDATE observacionObra SET ? WHERE uuid = ?`, [observacion, uuid]);

    return res.status(200).json({
      message: 'Observacion actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const deleteObservacion = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM observacionObra WHERE uuid = ? ', [uuid]);
    const foto: FotoObservacionObra = row as FotoObservacionObra;

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo eliminar la observacion, por que no existe. 🙁',
      });
    }

    const [rows]: [any[], FieldPacket[]] = await conn.query(
      'SELECT * FROM fotoObservacionObra WHERE uuidObservacionObra = ? ',
      [uuid]
    );
    const fotos: FotoObservacionObra[] = rows as FotoObservacionObra[];

    fotos.forEach(async (foto: FotoObservacionObra) => {
      try {
        await deleteFile(foto.keyName);
      } catch (error) {
        console.log('❌Ocurrio un error:', error);
        return res.status(400).json({
          message: error,
        });
      }
    });

    await conn.query('DELETE FROM observacionObra WHERE uuid = ?', [uuid]);

    return res.status(200).json({
      message: 'Observacion eliminado correctamente. 😀',
      body: foto.fileName,
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const addFotoObservacion = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const foto: FotoObservacionObra = JSON.parse(req.body.fotoObservacion);
    const files: Array<Express.Multer.File> | any = req.files;
    const file: Express.Multer.File = files[0];
    let fileUploaded: FileResponse;

    if (!file) {
      return res.status(400).json({
        message: 'No se ha podido registrar, no se cargo la imagen. 🙁',
      });
    }

    fileUploaded = await uploadOneFile(file, '/mendozarq/observaciones/images');
    foto.keyName = fileUploaded.data.Key;
    foto.location = fileUploaded.data.Location;
    foto.fileName = fileUploaded.originalName;

    foto.uuid = uuid();

    await conn.query('INSERT INTO fotoObservacionObra SET ? ', foto);

    return res.status(201).json({
      message: `Imagen ${fileUploaded.originalName} creado exitosamente! 😀`,
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const deleteFotoObservacion = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM fotoObservacionObra WHERE uuid = ? ', [
      uuid,
    ]);
    const foto: FotoObservacionObra = row as FotoObservacionObra;

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo eliminar la foto, por que no existe. 🙁',
      });
    }

    await deleteFile(foto.keyName);

    await conn.query('DELETE FROM fotoObservacionObra WHERE uuid = ?', [uuid]);

    return res.status(200).json({
      message: 'Foto eliminado correctamente. 😀',
      body: foto.fileName,
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
