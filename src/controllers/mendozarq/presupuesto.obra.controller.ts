import { Response, Request } from 'express';
import { FieldPacket, Pool } from 'mysql2/promise';
import { v4 as uuid } from 'uuid';

import { connect } from './../../classes/database';
import {
  PresupuestoObra,
  PresupuestoObraView,
  PresupuestoDTO,
  CapituloDetalleProyecto,
  CapituloPresupuesto,
  DetalleCapitulo,
} from './../../models/mendozarq/presupuestos.interface';
import { Roles } from './../../models/auth/usuario.interface';

// ====================>
export const addPresupuestoObra = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const presupuestoObra: PresupuestoObra = req.body;

    if (!presupuestoObra.nombre || !presupuestoObra.uuidCliente || !presupuestoObra.uuidUsuario) {
      return res.status(400).json({
        message: 'No se ha podido registrar, por favor ingrese los datos del presupuesto. 🙁',
      });
    }

    presupuestoObra.uuid = uuid();

    await conn.query('INSERT INTO presupuestoObra SET ?', [presupuestoObra]);

    return res.status(201).json({
      message: 'Presupuesto creado exitosamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================>
export const getOnePresupuestoObra = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[presupuestoobra]]: [any[], FieldPacket[]] = await conn.query(
      `
      SELECT p.*,
      concat_ws(' ', u.nombre, u.apellidoPaterno, u.apellidoMaterno) as usuario,
      concat_ws(' ', c.nombre, c.apellidoPaterno, c.apellidoMaterno) as cliente
      FROM presupuestoObra AS p
              LEFT JOIN usuario u on p.uuidUsuario = u.uuid
              LEFT JOIN usuario c on p.uuidCliente = c.uuid
              LEFT JOIN proyecto proy on p.uuidProyecto = proy.uuid
      WHERE p.uuid = ? `,
      [uuid]
    );

    return presupuestoobra
      ? res.status(200).json(presupuestoobra)
      : res.status(404).json({
          message: 'No se encontro el presupuesto. 🙁',
        });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================>

// ====================>
export const getAllPresupuestoObra = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    let presupuestoObra: PresupuestoObraView[] = [];

    switch (<Roles>res.locals.rol) {
      case 'administrador':
        const [AllRows]: [any[], FieldPacket[]] = await conn.query(`
				SELECT p.*,
							concat_ws(' ', u.nombre, u.apellidoPaterno, u.apellidoMaterno) as usuario,
								concat_ws(' ', c.nombre, c.apellidoPaterno, c.apellidoMaterno) as cliente
				FROM presupuestoObra AS p
								INNER JOIN usuario u on p.uuidUsuario = u.uuid
								INNER JOIN usuario c on p.uuidCliente = c.uuid
				ORDER BY p.creadoEn DESC;`);
        presupuestoObra = AllRows as PresupuestoObraView[];
        break;

      case 'arquitecto':
        const [SelectedRows]: [any[], FieldPacket[]] = await conn.query(
          `
				SELECT p.*,
							concat_ws(' ', u.nombre, u.apellidoPaterno, u.apellidoMaterno) as usuario,
								concat_ws(' ', c.nombre, c.apellidoPaterno, c.apellidoMaterno) as cliente
				FROM presupuestoObra AS p
								INNER JOIN usuario u on p.uuidUsuario = u.uuid
								INNER JOIN usuario c on p.uuidCliente = c.uuid
				WHERE uuidUsuario = ?	ORDER BY p.creadoEn DESC;`,
          [res.locals.jwtPayload.uuid]
        );
        presupuestoObra = SelectedRows as PresupuestoObraView[];
        break;
      default:
        break;
    }
    return res.status(200).json(presupuestoObra);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================>
export const updatePresupuestoObra = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;
    const presupuestoObra: PresupuestoObra = req.body;

    const [[presupuesto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM presupuestoObra WHERE uuid = ?', [
      uuid,
    ]);

    if (presupuesto) {
      await conn.query('UPDATE presupuestoObra SET ? WHERE uuid = ?', [presupuestoObra, uuid]);
      return res.status(200).json({
        message: 'Presupuesto actualizado correctamente! 😀',
      });
    }
    return res.status(404).json({
      message: 'No se pudo actualizar el presupuesto, por que no existe. 🙁',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// ====================>
export const deletePresupuestoObra = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[presupuesto]]: [any[], FieldPacket[]] = await conn.query('SELECT * FROM presupuestoObra WHERE uuid = ?', [
      uuid,
    ]);

    if (presupuesto) {
      await conn.query('DELETE FROM presupuestoObra WHERE uuid = ?', [uuid]);
      return res.status(200).json({
        message: 'PresupuestoObra eliminado correctamente. 😀',
      });
    }

    return res.status(404).json({
      message: 'No se pudo eliminar el presupuestoobra, por que no existe. 🙁',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

// *presupuesto obra proyecto

// ====================>
export const getOnePresupuestoObraProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const uuid: string = req.params.uuid;

    const [[presupuestoobra]]: [any[], FieldPacket[]] = await conn.query(
      `
      SELECT po.*,
      concat_ws(' ', u.nombre, u.apellidoPaterno, u.apellidoMaterno) as cliente
        FROM presupuestoObra AS po
                INNER JOIN proyecto p on po.uuidProyecto = p.uuid
                INNER JOIN usuario u on p.uuidCliente = u.uuid
        WHERE uuidProyecto = ? OR po.uuid = ?;`,
      [uuid, uuid]
    );

    return res.status(200).json(presupuestoobra);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const getAllPresupuestos = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    let presupuestos: PresupuestoObra[] = [];

    const [AllRows]: [any[], FieldPacket[]] = await conn.query(`
				SELECT p.*
				FROM presupuestoObra AS p
				ORDER BY p.creadoEn DESC;`);
    presupuestos = AllRows as PresupuestoObra[];

    return res.status(200).json(presupuestos);
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const importPresupuestoProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const { creadoEn, uuidCliente, uuidUsuario, ...presupuestoObra }: PresupuestoObra = req.body;
    const current_uuid = presupuestoObra.uuid;
    let capituloDetalle: CapituloDetalleProyecto[] = [];
    let capitulos: CapituloPresupuesto[] = [];
    let detalles: DetalleCapitulo[] = [];
    let rowsCapitulos: any[] = [];
    let rowsDetalles: any[] = [];

    presupuestoObra.uuid = uuid();

    await conn.query('INSERT INTO presupuestoObra SET ?', [presupuestoObra]);

    const [capitulos_detalles]: [any[], FieldPacket[]] = await conn.query(
      `
      SELECT cp.uuid, cp.nombre, cp.descuento, dc.descripcion, dc.unidad, dc.cantidad, dc.precioUnitario FROM capituloPresupuesto as cp
      LEFT JOIN detalleCapitulo dc on cp.uuid = dc.uuidCapituloPresupuesto
      WHERE uuidPresupuestoObra = ? ORDER BY cp.creadoEn,  dc.creadoEn;`,
      [current_uuid]
    );

    capituloDetalle = capitulos_detalles;

    capituloDetalle.forEach((cd) => {
      if (!capitulos.some((c) => c.uuid === cd.uuid)) {
        capitulos.push({
          uuid: cd.uuid,
          nombre: cd.nombre,
          descuento: cd.descuento,
          uuidPresupuestoObra: presupuestoObra.uuid,
        });
      }

      detalles.push({
        uuid: uuid(),
        uuidCapituloPresupuesto: cd.uuid,
        cantidad: cd.cantidad,
        descripcion: cd.descripcion,
        precioUnitario: cd.precioUnitario,
        unidad: cd.unidad,
      });
    });

    capitulos = capitulos.map((cap) => {
      const old_uuid = cap.uuid;
      const new_uuid = uuid();
      let capitulo: CapituloPresupuesto;
      capitulo = { ...cap, uuid: new_uuid };

      detalles = detalles.map((dt) => {
        if (dt.uuidCapituloPresupuesto === old_uuid) {
          dt.uuidCapituloPresupuesto = new_uuid;
          rowsDetalles.push(
            Object.values({
              uuid: dt.uuid,
              descripcion: dt.descripcion,
              unidad: dt.unidad,
              cantidad: dt.cantidad,
              precioUnitario: dt.precioUnitario,
              uuidCapituloPresupuesto: dt.uuidCapituloPresupuesto,
            } as DetalleCapitulo)
          );
        }
        return dt;
      });

      rowsCapitulos.push(
        Object.values({
          uuid: capitulo.uuid,
          nombre: capitulo.nombre,
          descuento: capitulo.descuento,
          uuidPresupuestoObra: capitulo.uuidPresupuestoObra,
        } as CapituloPresupuesto)
      );
      return capitulo;
    });

    await conn.query(`INSERT  INTO capituloPresupuesto (uuid, nombre, descuento, uuidPresupuestoObra) VALUES ?;`, [
      rowsCapitulos,
    ]);

    await conn.query(
      `INSERT  INTO detallecapitulo (uuid, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ?;`,
      [rowsDetalles]
    );

    return res.status(201).json({
      message: 'Presupuesto creado exitosamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};

export const addPresupuestoProyecto = async (req: Request, res: Response) => {
  try {
    const conn: Pool = await connect();
    const { uuidProyecto }: { uuidProyecto: string } = req.body;

    await conn.query(
      `INSERT INTO presupuestoObra (uuid, nombre, descripcion, uuidProyecto)
    SELECT ? , nombre, descripcion, uuid FROM proyecto AS p WHERE  p.uuid = ?;`,
      [uuid(), uuidProyecto]
    );

    return res.status(201).json({
      message: 'Presupuesto creado exitosamente! 😀',
    });
  } catch (error) {
    console.log('❌Ocurrio un error:', error);
    return res.status(400).json({
      message: error,
    });
  }
};
