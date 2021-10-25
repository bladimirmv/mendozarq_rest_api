import { deleteFile, uploadOneFile } from './../../classes/aws.s3';
import { DetalleCategoriaProducto, FotoProducto, Producto, ProductoView } from './../../models/liraki/producto.interface';
import { Pool, FieldPacket } from 'mysql2/promise';
import { Request, Response } from 'express';
import { connect } from '../../classes/database';
import { v4 as uuid } from 'uuid';
import { CategoriaProducto } from '../../models/liraki/categoria.producto.interface';
import { FileResponse } from '../../models/fileResponse.interface';



export const addProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const producto: ProductoView = req.body;
    let detalleCategoriaProducto: DetalleCategoriaProducto[];

    if (!producto.nombre || !producto.categorias) {
      return res.status(400).json({
        message: `No se ha podido registrar, por favor ingrese los datos del producto. 🙁`,
      });
    }
    producto.uuid = uuid();

    detalleCategoriaProducto = producto.categorias.map((categoriaProducto: CategoriaProducto) => {
      return {
        uuid: uuid(),
        uuidCategoria: categoriaProducto.uuid,
        uuidProducto: producto.uuid
      };
    });

    delete producto.categorias;

    await conn.query(`INSERT INTO producto SET ?`, [producto]);

    let mRows: any[] = [];

    detalleCategoriaProducto.forEach(async (detalle) => {
      mRows.push(Object.values(detalle));
    });

    await conn.query(`INSERT INTO detalleCategoriaProducto (uuid, uuidCategoria, uuidProducto) VALUES ?`, [mRows]);

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
      `SELECT * FROM categoriaProducto WHERE uuidProducto = ? ORDER BY creadoEn DESC`,
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
    let productoView: ProductoView[] = [];

    const [productos]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM producto ORDER BY creadoEn DESC`
    );

    const [categorias]: [any[], FieldPacket[]] = await conn.query(
      `SELECT cp.*, dcp.uuidProducto FROM detalleCategoriaProducto AS dcp
      INNER JOIN categoriaProducto cp on dcp.uuidCategoria = cp.uuid ORDER BY cp.creadoEn DESC;`);

    const [fotos]: [any[], FieldPacket[]] = await conn.query(
      `SELECT * FROM fotoProducto ORDER BY indice`
    );



    productos.forEach((producto: ProductoView) => {
      producto.categorias = categorias.filter((categoria: CategoriaProducto & { uuidProducto?: string }) =>
        categoria.uuidProducto == producto.uuid);
      producto.fotos = fotos.filter((foto: FotoProducto) => foto.uuidProducto == producto.uuid);
      productoView.push(producto);
    });

    return res.status(200).json(productoView);
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
    const [rows]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM fotoProducto WHERE uuidProducto = ? ', [uuid]);
    const fotos: FotoProducto[] = rows as FotoProducto[];


    fotos.forEach(async (foto: FotoProducto) => {
      try {
        await deleteFile(foto.keyName);
      } catch (error) {
        console.log('❌Ocurrio un error:', error);
        return res.status(400).json({
          message: error
        });
      }
    });

    await conn.query('DELETE FROM fotoProducto WHERE uuidProducto = ?', [uuid]);

    await conn.query('DELETE FROM detalleCategoriaProducto WHERE uuidProducto = ?', [uuid]);

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

// ************************************ Imagenes ****************************************************
export const addFotoProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const foto: FotoProducto = JSON.parse(req.body.fotoProducto);
    const files: Array<Express.Multer.File> | any = req.files;
    const file: Express.Multer.File = files[0];
    let fileUploaded: FileResponse;

    if (!file) {
      return res.status(400).json({
        message: 'No se ha podido registrar, no se cargo la imagen. 🙁'
      });
    }


    fileUploaded = await uploadOneFile(file, '/liraki/images');
    foto.keyName = fileUploaded.data.Key;
    foto.location = fileUploaded.data.Location;
    foto.nombre = fileUploaded.originalName;

    foto.uuid = uuid();


    await conn.query('INSERT INTO fotoProducto SET ? ', foto);


    return res.status(201).json({
      message: `Imagen ${fileUploaded.originalName} creado exitosamente! 😀`
    });

  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error
    });
  }
}



export const deleteFotoProducto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;


    const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM fotoProducto WHERE uuid = ? ', [uuid]);
    const foto: FotoProducto = row as FotoProducto;

    if (!row) {
      return res.status(404).json({
        message: 'No se pudo eliminar la foto, por que no existe. 🙁',
      });
    }

    await deleteFile(foto.keyName);

    await conn.query('DELETE FROM fotoProducto WHERE uuid = ?', [uuid]);

    return res.status(200).json({
      message: 'Foto eliminado correctamente. 😀',
      body: foto.nombre
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error
    });
  }
};





// INSERT INTO table(id, Col1, Col2) VALUES(1, 1, 1), (2, 2, 3), (3, 9, 3), (4, 10, 12)
// ON DUPLICATE KEY UPDATE Col1 = VALUES(Col1), Col2 = VALUES(Col2);