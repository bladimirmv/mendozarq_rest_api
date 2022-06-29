import { CategoriaProducto } from './../../models/liraki/categoria.producto.interface';
import { HomePage } from './../../models/liraki/home.page.interface';
import { ProductoView } from './../../models/liraki/producto.interface';
import { Pool, FieldPacket, RowDataPacket } from 'mysql2/promise';
import { Request, Response } from 'express';
import { connect } from '../../classes/database';

export const getHomePage = async (req?: Request, res?: Response) => {
  try {
    const conn: Pool = await connect();
    let homePage: HomePage = {} as HomePage;

    const [firstGroupCategoria]: [any[], FieldPacket[]] = await conn.query(`SELECT *
		FROM categoriaProducto as c
		ORDER BY c.creadoEn DESC  LIMIT 4;`);

    const [secondGroupCategoria]: [any[], FieldPacket[]] = await conn.query(`SELECT *
		FROM categoriaProducto as c
		ORDER BY c.creadoEn  LIMIT 4;`);

    const [enDescuento]: [any[], FieldPacket[]] = await conn.query(`SELECT p.*, fp.keyName
		FROM producto as p
		INNER JOIN fotoProducto fp on p.uuid = fp.uuidProducto
		WHERE fp.indice = 0
		ORDER BY p.descuento DESC, p.creadoEn   DESC  LIMIT 10;`);

    const [recienAgregados]: [any[], FieldPacket[]] = await conn.query(`SELECT p.*, fp.keyName
		FROM producto as p
		INNER JOIN fotoProducto fp on p.uuid = fp.uuidProducto
		WHERE fp.indice = 0
		ORDER BY p.creadoEn   DESC  LIMIT 10;`);

    const [menoresDeMil]: [any[], FieldPacket[]] = await conn.query(`SELECT p.*, fp.keyName
		FROM producto as p
		INNER JOIN fotoProducto fp on p.uuid = fp.uuidProducto
		WHERE fp.indice = 0 and p.precio >= 1000 and p.precio <=2000
		ORDER BY p.stock>0  LIMIT 10;`);

    homePage = {
      recienAgregados,
      enDescuento,
      card_producto: [
        {
          id: 'menores-a-2mil',
          nombre: 'Menores a 2000BS.',
          producto: menoresDeMil,
          queryParams: '1000bs_2000bs',
        },
      ],
      card_categorias: [{ categoria: firstGroupCategoria }, { categoria: secondGroupCategoria }],
    };

    return res?.status(200).json(homePage);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res?.status(400).json({
      message: error,
    });
  }
};

export const getRecienAgregados = async (req?: Request, res?: Response) => {
  try {
    const conn: Pool = await connect();

    const [recienAgregados]: [any[], FieldPacket[]] = await conn.query(`SELECT p.*, fp.keyName
		FROM producto as p
		INNER JOIN fotoProducto fp on p.uuid = fp.uuidProducto
		WHERE fp.indice = 0
		ORDER BY p.creadoEn   DESC  LIMIT 10;`);

    return res?.status(200).json(recienAgregados);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res?.status(400).json({
      message: error,
    });
  }
};
