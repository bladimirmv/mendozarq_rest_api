import { deleteFile, uploadOneFile } from './../../classes/aws.s3';
import { FileResponse } from './../../models/fileResponse.interface';
import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';
import { connect } from './../../classes/database';

import { CategoriaProducto } from './../../models/liraki/categoria.producto.interface';

export const addCategoriaProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    let categoriaProducto: CategoriaProducto = JSON.parse(req.body.categoriaProducto);
    const files: Array<Express.Multer.File> | any = req.files;
    const file: Express.Multer.File = files[0];
    let fileUploaded: FileResponse;

    if (!file) {
      return res.status(400).json({
        message: 'No se ha podido registrar, no se cargo la imagen. 🙁',
      });
    }

    if (!categoriaProducto.nombre) {
      return res.status(400).json({
        message: `No se ha podido registrar, por favor ingrese los datos de la categoria. 🙁`,
      });
    }

    fileUploaded = await uploadOneFile(file, '/liraki/images');
    categoriaProducto.keyName = fileUploaded.data.Key;
    categoriaProducto.location = fileUploaded.data.Location;
    categoriaProducto.fileName = fileUploaded.originalName;

    categoriaProducto.uuid = uuid();

    await conn.query(`INSERT INTO categoriaProducto SET ?`, [categoriaProducto]);

    return res.status(201).json({
      message: 'Categoria creado exitosamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const getOneCategoriaProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[categoriaProducto]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM categoriaProducto WHERE uuid = ?`,
      [uuid]
    );

    return categoriaProducto
      ? res.status(200).json(categoriaProducto)
      : res.status(404).json({ message: 'No se encontro la categoria. 🙁' });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const getAllcategoriaProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();

    const [categoriaProducto]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM categoriaProducto ORDER BY creadoEn DESC`
    );

    return res.status(200).json(categoriaProducto);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const getAllcategoriaProductoByPage = async (req: Request, res: Response) => {
  try {
    const page: string = req.params.page;
    const size: number = 15;
    const conn: Pool = await connect();

    const [categoriaProducto]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM categoriaProducto ORDER BY creadoEn DESC LIMIT ?, ? ;`,
      [(Number(page) - 1) * size, size]
    );

    return res.status(200).json(categoriaProducto);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const updatecategoriaProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    const categoriaProducto: CategoriaProducto = req.body;

    const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM categoriaProducto WHERE uuid = ?', [uuid]);

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo actualizar la categoria, por que no existe. 🙁',
      });
    }

    await conn.query('UPDATE categoriaProducto SET ? WHERE uuid = ?', [categoriaProducto, uuid]);

    return res.status(200).json({
      message: 'Categoria actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const updatecategoriaProductoMulter = async (req: Request, res: Response) => {
  try {
    const uuid: string = req.params.uuid;
    const conn: Pool = await connect();
    const files: Array<Express.Multer.File> | any = req.files;
    const file: Express.Multer.File = files[0];
    let categoriaProducto: CategoriaProducto = JSON.parse(req.body.categoriaProducto);
    let fileUploaded: FileResponse;

    if (!file) {
      return res.status(400).json({
        message: 'No se ha podido registrar, no se cargo la imagen. 🙁',
      });
    }

    if (!categoriaProducto.nombre) {
      return res.status(400).json({
        message: `No se ha podido registrar, por favor ingrese los datos de la categoria. 🙁`,
      });
    }

    const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM categoriaProducto WHERE uuid = ?', [uuid]);

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo actualizar la categoria, por que no existe. 🙁',
      });
    }

    if (row.keyName) {
      await deleteFile(row.keyName);
    }

    fileUploaded = await uploadOneFile(file, '/liraki/images');
    categoriaProducto.keyName = fileUploaded.data.Key;
    categoriaProducto.location = fileUploaded.data.Location;
    categoriaProducto.fileName = fileUploaded.originalName;

    await conn.query('UPDATE categoriaProducto SET ? WHERE uuid = ?', [categoriaProducto, uuid]);

    return res.status(200).json({
      message: 'Categoria actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const deletecategoriaProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM categoriaProducto WHERE uuid = ?', [uuid]);

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo eliminar la categoria, por que no existe. 🙁',
      });
    }

    await conn.query('DELETE FROM categoriaProducto WHERE uuid = ?', [uuid]);

    return res.status(200).json({
      message: 'Categoria eliminado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
