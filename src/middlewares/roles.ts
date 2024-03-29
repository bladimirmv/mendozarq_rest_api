import { async } from 'rxjs';
import { Pool, FieldPacket } from 'mysql2/promise';
import { Usuario, Roles } from './../models/auth/usuario.interface';
import { Request, Response, NextFunction } from 'express';

import { connect } from './../classes/database';

export const checkRole = (roles: Array<Roles>) => {
  return async (req: Request, res: Response, next: NextFunction) => {
    const { uuid } = res.locals.jwtPayload;
    try {
      let conn: Pool = await connect();
      let usuario: Usuario = {} as Usuario;
      const [[row]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM usuario WHERE uuid = ?', [uuid]);

      usuario = row as Usuario;

      if (usuario) {
        const { rol }: Usuario = usuario;
        res.locals.rol = rol;

        // *checking rol
        if (!roles.includes(rol as Roles)) {
          return res.status(401).json({
            message: 'Acceso no autorizado, no tienes permisos para continuar. 🙁',
          });
        }

        await conn.query('set @uuidCreadoPor = ?, @creadoPor = ?;', [
          usuario.uuid,
          `${usuario.nombre} ${usuario.apellidoPaterno} ${usuario.apellidoMaterno}`,
        ]);

        next();
      }
    } catch (error) {
      return res.status(400).json({ message: error });
    }
  };
};

export async function isValidRole(jwtPayload: any, roles: Array<Roles>): Promise<boolean> {
  const { uuid } = jwtPayload;
  try {
    const conn: Pool = await connect();
    const [[usuario]]: [any[], FieldPacket[]] = await conn.query('select * from usuario where uuid = ?', [uuid]);

    if (usuario) {
      const { rol }: Usuario = usuario;
      // *checking rol
      return roles.includes(rol as Roles) ? true : false;
    }
    return false;
  } catch (e) {
    console.log('❌ Ocurrio un error al validar el rol: ', e);
    return false;
  }
}
