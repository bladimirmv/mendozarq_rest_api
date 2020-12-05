create database mendozarq;
use mendozarq;

create table usuario(
    uuid varchar(100) primary key,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(50) not null,
    apellidoPaterno varchar(50) not null,
    apellidoMaterno varchar(50) ,
    celulario int,
    direccion text,
    correo varchar(100),
    username varchar(50) not null,
    contrasenha varchar(100) not null,
    rol varchar(20) not null
);