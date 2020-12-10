export type Estado = 'En curso' | 'Pendiente' | 'Fecha limite' | 'Finalizado'; //aca retiramos esto para establecerlo en la bd?
export interface ObservacionServicio {
  idObsrParticipante?: string;
  creadoEn?: Date;
  idVisita: string;
  estado: Estado;  //aca cambiamos esto?
  idServicio?: string;
  descripcion?: string;
}