import { uploadOneFile } from './../../classes/aws.s3';
import { DetalleCategoriaProducto, Producto, ProductoView } from './../../models/liraki/producto.interface';
import { Pool, FieldPacket } from 'mysql2/promise';
import { Request, Response } from 'express';
import { connect } from '../../classes/database';
import { v4 as uuid } from 'uuid';
import { CategoriaProducto } from '../../models/liraki/categoria.producto.interface';

export const addProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const producto: ProductoView = req.body;
    let detalleCategoriaProducto: DetalleCategoriaProducto[];

    if (!producto.nombre) {
      return res.status(400).json({
        message: `No se ha podido registrar, por favor ingrese los datos del producto. 🙁`,
      });
    }

    producto.uuid = uuid();
    await conn.query(`INSERT INTO producto SET ?`, [producto]);

    detalleCategoriaProducto = producto.categorias.map((categoriaProducto: CategoriaProducto) => {
      return {
        uuid: uuid(),
        uuidCategoria: categoriaProducto.uuid,
        uuidProducto: producto.uuid
      };
    });

    await conn.query(`INSERT INTO detalleCategoriaProducto SET ?`, [detalleCategoriaProducto]);


    return res.status(201).json({
      message: 'Producto creado exitosamente! 😀',
      data: producto
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error
    });
  }
};

export const getOneProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    let productoView: ProductoView;

    const [[producto]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM producto WHERE uuid = ?`,
      [uuid]
    );

    const [[categorias]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM categoriaProducto WHERE uuidProducto = ?`,
      [uuid]
    );

    const [[fotos]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM fotoProducto WHERE uuidProducto = ?`,
      [uuid]
    );

    productoView = producto + {
      categorias,
      fotos
    };

    return (producto)
      ? res.status(200).json(productoView)
      : res.status(404).json({ message: 'No se encontro el producto. 🙁' });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const getAllProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    let productoView: ProductoView[];

    const [productos]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM producto`
    );

    const [[categorias]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM categoriaProducto`
    );

    const [[fotos]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM fotoProducto`
    );






    return res.status(200).json(productos);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const updateProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    const producto: Producto = req.body;

    const [[row]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM producto WHERE uuid = ?`,
      [uuid]
    );

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo actualizar el producto, por que no existe. 🙁',
      });
    }

    await conn.query(`UPDATE producto SET ? WHERE uuid = ?`, [producto, uuid]);

    return res.status(200).json({
      message: 'Producto actualizado correctamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const deleteProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[row]]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM producto WHERE uuid = ?`,
      [uuid]
    );

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo eliminar el producto, por que no existe. 🙁',
      });
    }

    await conn.query('DELETE FROM producto WHERE uuid = ?', [uuid]);

    return res.status(200).json({
      message: 'Producto eliminado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error
    });
  }
};
