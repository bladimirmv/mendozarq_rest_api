import { Usuario } from '../auth/usuario.interface';

export interface OpinionProducto {
  uuid: string;
  creadoEn: Date;
  titulo: string;
  descripcion: string;
  estado: boolean | number;
  verificado: boolean;
  puntuacion: number;
  uuidProducto: string;
  uuidCliente: string;
}

export interface OpinionProductoView extends OpinionProducto {
  cliente?: string;
  nombreProducto?: string;
}
