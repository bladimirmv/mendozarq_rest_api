import { Router } from 'express';
import multer from 'multer';
import * as p from './../../controllers/liraki/producto.controller';
import { checkJwt } from './../../middlewares/jwt';
import { checkRole } from './../../middlewares/roles';

const upload = multer().any();

const router = Router();

router
  .route('/')
  .get(p.getAllProducto)
  .post([checkJwt, checkRole(['administrador'])], p.addProducto);

router.route('/page/:page').get(p.getAllProductoByPage);

router
  .route('/:uuid')
  .get(p.getOneProducto)
  .put([checkJwt, checkRole(['administrador'])], p.updateProducto)
  .delete([checkJwt, checkRole(['administrador'])], p.deleteProducto);

router
  .route('/fotoProducto')

  .post([checkJwt, checkRole(['administrador'])], upload, p.addFotoProducto);

router
  .route('/fotoProducto/:uuid')
  .get([checkJwt, checkRole(['administrador', 'vendedor'])], p.getFotoProducto)
  .put([checkJwt, checkRole(['administrador'])], p.updateFotoProducto)

  .delete([checkJwt, checkRole(['administrador'])], p.deleteFotoProducto);

export default router;

/**
 * @swagger
 * components:
 *  schemas:
 *    Producto:
 *      type: object
 *      properties:
 *        uuid:
 *          type: string
 *          description: uuid unico autogenerado para el producto
 *        creadoEn:
 *          type: string
 *          description: fecha de creacion del producto
 *        nombre:
 *          type: string
 *          description: nombre unico para el producto
 *        descripcion:
 *          type: string
 *          description: descripcion del producto
 *        precio:
 *          type: number
 *          description: precio del producto
 *        moneda:
 *          type: string
 *          description: tipo de moneda del producto(default "BS.")
 *        stock:
 *          type: number
 *          description: stock del producto
 *        descuento:
 *          type: number
 *          description: descuento del producto
 *        estado :
 *          type: boolean
 *          description: estado del producto
 *      required:
 *        - nombre
 *        - descripcion
 *        - precio
 *        - stock
 *        - estado
 *      example:
 *        uuid: 2fe5ff3e-f808-4e6d-916a-d4959bb87227
 *        creadoEn: 2021-11-24 21:23:23
 *        nombre: Mesa para exterior o jardin de madera cedro
 *        descripcion: Esta es una descripcion de prueba
 *        precio: 700.00
 *        moneda: Bs.
 *        stock: 3
 *        descuento: 1.00
 *        estado: 1
 *    ProductoNotFound:
 *      type: object
 *      properties:
 *        message:
 *          type: string
 *          description: mensaje para productos no encontrados
 *      example:
 *        message: No se encontro el producto. 🙁
 *
 *  parameters:
 *    uuidProducto:
 *      in: path
 *      name: uuid
 *      required: true
 *      schema:
 *        type: string
 *      description: uuid del producto
 */

/**
 * @swagger
 * tags:
 *  name: Productos
 *  description: Producto endpoint
 */

/**
 * @swagger
 * /producto:
 *  get:
 *    summary: Retorna una lista de productos
 *    tags: [Productos]
 *    responses:
 *      200:
 *        description: Lista de Productos
 *        content:
 *          application/json:
 *            schema:
 *              type: array
 *              items:
 *                $ref: '#/components/schemas/Producto'
 */

/**
 * @swagger
 * /producto/{uuid}:
 *  get:
 *    summary: Retorna un producto por uuid
 *    tags: [Productos]
 *    parameters:
 *      - $ref: '#/components/parameters/uuidProducto'
 *    responses:
 *      200:
 *        description: Producto encontrado
 *        content:
 *          application/json:
 *            schema:
 *            $ref: '#/components/schemas/Producto'
 *      404:
 *        description: Producto no encontrado
 *        content:
 *          application/json:
 *            schema:
 *              $ref: '#/components/schemas/ProductoNotFound'
 */

/**
 * @swagger
 * /producto:
 *  post:
 *    summary: Crea un nuevo producto
 *    tags: [Productos]
 *    requestBody:
 *      required: true
 *      content:
 *        application/json:
 *          schema:
 *            $ref: '#/components/schemas/Producto'
 *    responses:
 *      200:
 *        description: Producto creado exitosamente! 😀
 *        content:
 *          application/json:
 *            schema:
 *              $ref: '#/components/schemas/Producto'
 *      500:
 *        description: Some server error
 *
 */
/**
 * @swagger
 * /producto/{uuid}:
 *  delete:
 *    summary: Elimina un producto por uuid
 *    tags: [Productos]
 *    parameters:
 *      - $ref: '#/components/parameters/uuidProducto'
 *    responses:
 *      200:
 *        description: Producto eliminado exitosamente! 😀
 *        content:
 *          application/json:
 *            schema:
 *            $ref: '#/components/schemas/Producto'
 *      404:
 *        description: Producto no econtrado
 *        content:
 *          application/json:
 *            schema:
 *              $ref: '#/components/schemas/ProductoNotFound'
 *
 */

/**
 * @swagger
 * /producto/{uuid}:
 *  put:
 *    summary: Actualiza un producto por uuid
 *    tags: [Productos]
 *    parameters:
 *      - $ref: '#/components/parameters/uuidProducto'
 *    requestBody:
 *      required: true
 *      content:
 *        application/json:
 *          schema:
 *            $ref: '#/components/schemas/Producto'
 *    responses:
 *      200:
 *        description: Producto actualizado exitosamente! 😀
 *        content:
 *          application/json:
 *            schema:
 *            $ref: '#/components/schemas/Producto'
 *      404:
 *        description: Producto no encontrado
 *        content:
 *          application/json:
 *            schema:
 *              $ref: '#/components/schemas/ProductoNotFound'
 *
 */
