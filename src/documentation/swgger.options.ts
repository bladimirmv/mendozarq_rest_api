import { Options } from "swagger-jsdoc";

export const options: Options = {

	definition: {
		openapi: "3.0.0",
		info: {
			title: 'Mendozarq-Liraki API',
			version: '1.0.0',
			description: 'Es una `REST-API` con una arquitectura `monolitica`, creado por [Bladimir Medrano Vargas](https://stackoverflow.com/users/12375555/bladimir-medrano-vargas?tab=profile), para su unico consumo en `Mendozarq & Liraki` con una base de datos relacional `Mysql` y con almacenamiento en la nube de `AWS-S3`.'
		},
		servers: [
			{
				url: 'http://localhost:3000'
			}
		]
	},
	apis: ['./src/routes/liraki/*.ts']
}


// 	* uuid:
//  * type: string
// 	* description: uuid unico autogenerado para el producto
// 		* creadoEn:
//  * type: string
// 	* description: fecha de creacion del producto
// 		* nombre:
//  * type: string
// 	* description: nombre unico para el producto
// 		* descipcion:
//  * type: string
// 	* description: descripcion del producto
// 		* precio:
//  * type: number
// 	* description: precio del producto
// 		* moneda:
//  * type: string
// 	* description: tipo de moneda del producto default BS.
//  * stock:
//  * type: number
// 	* description: stock del producto
// 		* descuento:
//  * type: number
// 	* description: descuento del producto