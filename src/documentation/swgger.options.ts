import { Options } from 'swagger-jsdoc';

export const options: Options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Mendozarq-Liraki API',
      version: '1.0.0',
      description:
        'Es una `REST-API`, creado por [Bladimir Medrano Vargas](https://stackoverflow.com/users/12375555/bladimir-medrano-vargas?tab=profile), para su unico consumo en `Mendozarq & Liraki` con una base de datos relacional `Mysql` y con almacenamiento en la nube de `AWS-S3`.',
    },
    servers: [
      {
        url: 'http://localhost:3000',
      },
    ],
  },
  apis: ['./src/routes/liraki/*.ts'],
};
