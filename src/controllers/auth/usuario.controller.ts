import { Response, Request } from 'express';
import generator from 'generate-password';
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';
import { Pool, FieldPacket, RowDataPacket, QueryError } from 'mysql2/promise';

import { connect } from './../../classes/database';
import { Usuario } from './../../models/auth/usuario.interface';
import { createToken } from './auth.controller';

import { emitAllLogs } from './../../controllers/logs/logs.controller';

// ========================================================================================
function generateUsuario(usuario: Usuario): Usuario {
  let lack = 0;
  if (String(usuario.nombre).length < 5) {
    lack = 5 - String(usuario.nombre).length;
  }

  usuario.username =
    usuario.nombre.substring(0, 5) + generator.generate({ length: 5 + lack, numbers: true, uppercase: false });
  return usuario;
}
// =================================================================================
function generateContrasenha(usuario: Usuario): Usuario {
  usuario.contrasenha = generator.generate({ length: 10, numbers: true });
  return usuario;
}
// ======================================================================
export async function addUsuario(req: Request, res: Response) {
  try {
    // *creating pool
    const conn: Pool = await connect();
    let usuario: Usuario = req.body;
    let { contrasenha, username } = usuario;

    // *checking autogenerate usuario
    if (usuario.autoUsuario && usuario.nombre) {
      usuario = generateUsuario(usuario);
      username = usuario.username;
    }
    if (usuario.autoContrasenha) {
      usuario = generateContrasenha(usuario);
      contrasenha = usuario.contrasenha;
    }

    // *checking usuario data
    if (!usuario.contrasenha || !usuario.username || !usuario.rol || !usuario.nombre) {
      return res.status(400).json({
        message: 'Por favor ingrese los campos requeridos. ❌',
      });
    }

    // *encrypting contrasenha
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(usuario.contrasenha, salt);
    usuario.contrasenha = hash;

    // *generating uuid
    usuario.uuid = uuid();

    // *checking username
    const [[findUsername]]: [any[], FieldPacket[]] = await conn.query(
      'select username from usuario where username = ?',
      [usuario.username]
    );

    if (findUsername) {
      // conn.end();
      return res.status(400).json({
        message: `El username \'${usuario.username}\' ya esta en uso, por favor ingrese otro valido o active la opcion de generar automaticamente. 🙁`,
      });
    } else {
      delete usuario.autoUsuario;
      delete usuario.autoContrasenha;

      usuario.nombre.toLocaleLowerCase();
      usuario.apellidoMaterno?.toLocaleLowerCase();
      usuario.apellidoMaterno?.toLocaleLowerCase();

      // *adding usuario
      await conn.query('INSERT INTO usuario SET ?', [usuario]);

      emitAllLogs();

      // conn.end();
      // *adding contrasenha and usuario
      usuario.username = username;
      usuario.contrasenha = contrasenha;
      // *response
      return res.status(201).send(usuario);
    }
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
}

// ===================================================================================================
export async function getUsuario(req: Request, res: Response) {
  try {
    // *creating pool
    const uuid = req.params.id;
    const conn: Pool = await connect();

    // * finding usuario
    const [[usuario]]: [any[], FieldPacket[]] = await conn.query('select  * from usuario where uuid = ?', [uuid]);
    // conn.end();
    // console.log(usuario);

    if (usuario) {
      res.status(200).send(usuario);
    } else {
      return res.status(404).json({
        message: 'No se encontro el usuario. 🙁',
      });
    }
  } catch (error) {
    return res.status(400).json({
      message: error,
    });
  }
}
// ===================================================================================================
export async function getAllUsuarios(req: Request, res: Response) {
  try {
    // *creating pool
    let conn: Pool = await connect();

    // *geting all usuarios
    const [usuarios]: [any[], FieldPacket[]] = await conn.query('select * from usuario order by creadoEn desc');
    // conn.end();

    // *returning data
    return res.status(200).send(usuarios);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
}
// ===================================================================================================
export async function updateUsuario(req: Request, res: Response) {
  try {
    // *creating pool
    const conn: Pool = await connect();
    const uuid = req.params.id;
    let usuario: Usuario = req.body;
    let { contrasenha, username } = usuario;

    if (usuario.autoUsuario && usuario.nombre) {
      usuario = generateUsuario(usuario);
      username = usuario.username;
    }
    if (usuario.autoContrasenha) {
      usuario = generateContrasenha(usuario);
      contrasenha = usuario.contrasenha;
    }

    if (!usuario.username || !usuario.rol || !usuario.nombre) {
      return res.status(400).json({
        message: 'Por favor ingrese los campos requeridos. ❌',
      });
    }
    // *if exist contrasenha: encrypting new contrasenha
    if (contrasenha) {
      const salt = await bcrypt.genSalt(10);
      const hash = await bcrypt.hash(usuario.contrasenha, salt);
      usuario.contrasenha = hash;
    }

    // *checking username
    const [[findUsuario]]: [any[], FieldPacket[]] = await conn.query('select * from usuario where username = ?;', [
      usuario.username,
    ]);
    const usr: Usuario = findUsuario;

    if (findUsuario && usr.uuid !== uuid) {
      //conn.end();
      return res.status(400).json({
        message: `El username \'${usuario.username}\' ya esta en uso, porfavor ingrese otro valido o active la opcion de generar automaticamente. ❌`,
      });
    } else {
      delete usuario.autoUsuario;
      delete usuario.autoContrasenha;
      usuario.nombre.toLocaleLowerCase();
      usuario.apellidoMaterno?.toLocaleLowerCase();
      usuario.apellidoMaterno?.toLocaleLowerCase();

      // *updating usuario
      // const { nombre, apellidoMaterno, apellidoPaterno }: Usuario =
      //   res.locals.jwtPayload;
      // await conn.query('set @uuidCreadoPor = ?, @creadoPor = ?;', [
      //   res.locals.jwtPayload.uuid,
      //   `${nombre} ${apellidoPaterno} ${apellidoMaterno}`,
      // ]);

      // console.log('usuario: ', res.locals.jwtPayload);

      await conn.query('update usuario set ? where uuid = ?', [usuario, uuid]);

      emitAllLogs();

      //conn.end();
      // *adding contrasenha and usuario
      usuario.username = username;
      usuario.contrasenha = contrasenha;
      // *response
      return res.status(201).send(usuario);
    }
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
}
// ===================================================================================================
export async function deleteUsuario(req: Request, res: Response) {
  try {
    // *creating pool
    const conn = await connect();
    const uuid = req.params.id;

    // *deleting usuario by id
    // const { nombre, apellidoMaterno, apellidoPaterno }: Usuario =
    //   res.locals.jwtPayload;
    // await conn.query('set @uuidCreadoPor = ?, @creadoPor = ?;', [
    //   res.locals.jwtPayload.uuid,
    //   `${nombre} ${apellidoPaterno} ${apellidoMaterno}`,
    // ]);
    await conn.query('DELETE from usuario where uuid = ?', [uuid]);

    emitAllLogs();

    return res.status(200).json({
      message: 'Usuario eliminado correctamente. 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
}
// ===================================================================================================

// ===================================================================================================
export async function usuarioRegister(req: Request, res: Response) {
  try {
    // *creating pool
    const conn: Pool = await connect();
    let usuario: Usuario = req.body;
    let { contrasenha, username } = usuario;

    // *checking autogenerate usuario
    if (usuario.autoUsuario && usuario.nombre) {
      usuario = generateUsuario(usuario);
      username = usuario.username;
    }
    if (usuario.autoContrasenha) {
      usuario = generateContrasenha(usuario);
      contrasenha = usuario.contrasenha;
    }

    // *checking usuario data
    if (!usuario.contrasenha || !usuario.username || !usuario.rol || !usuario.nombre) {
      return res.status(400).json({
        message: 'Por favor ingrese los campos requeridos. ❌',
      });
    }

    // *encrypting contrasenha
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(usuario.contrasenha, salt);
    usuario.contrasenha = hash;

    // *generating uuid
    usuario.uuid = uuid();

    // *checking username
    const [[findUsername]]: [any[], FieldPacket[]] = await conn.query(
      'select username from usuario where username = ?',
      [usuario.username]
    );

    if (findUsername) {
      // conn.end();
      return res.status(400).json({
        message: `El username \'${usuario.username}\' ya esta en uso, por favor ingrese otro valido. 🙁`,
      });
    } else {
      delete usuario.autoUsuario;
      delete usuario.autoContrasenha;
      // *adding usuario
      await conn.query('INSERT INTO usuario SET ?', [usuario]);
      // conn.end();
      // *adding contrasenha and usuario
      usuario.username = username;
      usuario.contrasenha = contrasenha;
      // *response
      return res.status(201).json({
        message: `Bienvenido ${usuario.nombre}! 👋`,
        token: createToken(usuario),
        body: usuario,
      });
    }
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
}

export async function getAllStatsUsuarios(req: Request, res: Response) {
  try {
    // *creating pool
    let conn: Pool = await connect();

    // *geting all usuarios
    const [[usuarios]]: [any[], FieldPacket[]] =
      await conn.query(`select sum(case when u.rol = 'administrador' then 1 else 0 end) as administrador,
    sum(case when u.rol = 'arquitecto' then 1 else 0 end) as arquitecto,
    sum(case when u.rol = 'vendedor' then 1 else 0 end) as vendedor,
    sum(case when u.rol = 'cliente' then 1 else 0 end) as cliente
    from usuario as u;`);
    // conn.end();

    // *returning data
    return res.status(200).send(usuarios);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
}
