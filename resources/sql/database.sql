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

CREATE TABLE proyecto (
    idProyecto varchar(100) primary key,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(50) not null,
    descripcion TEXT not null,
    estado BOOLEAN not null,
    fechaInicio  DATE not null,
    fechaFinal DATE not null,
    lugarProyecto varchar(200) not null,
    filerefCont TEXT not null,
    urlCont TEXT not null,
    idCliente varchar(100) not null,
    nombreCliente varchar(100) not null,
    porcentaje INT not null,
	FOREIGN KEY(idCliente) REFERENCES usuario(uuid)
);

CREATE TABLE categoriaProyecto(
    idCategoriaProyecto varchar(100) primary key,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(50) not null,
    color varchar(200) not null
);

CREATE TABLE categoriasAsignadasProyecto (
    id int AUTO_INCREMENT PRIMARY KEY,
    idProyecto varchar(100) not null,
    idCategoriaProyecto varchar(100) not null,
    FOREIGN KEY(idProyecto) REFERENCES proyecto(idProyecto),
    FOREIGN KEY(idCategoriaProyecto) REFERENCES categoriaProyecto(idCategoriaProyecto)
);

CREATE TABLE cronograma (
    idCronograma varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    fechaInicio  DATE not null,
    fechaFinal DATE not null,
    idProyecto varchar(100) not null,
    FOREIGN KEY (idProyecto) REFERENCES proyecto(idProyecto)
);

CREATE TABLE actividad (
    idActividad varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(100) NOT NULL,
    fechaInicio  DATE not null,
    fechaFinal DATE not null,
    porcentaje int not null,
    creadoPor varchar(100) not null,
    idCronograma varchar(100) not null,
    FOREIGN KEY (creadoPor) REFERENCES usuario(uuid),
    FOREIGN KEY (idCronograma) REFERENCES cronograma(idCronograma)
);

CREATE TABLE categoriaRecurso (
    idCategoriaRecurso varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(100) NOT NULL
);

CREATE TABLE recurso (
    idRecurso varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar (50) not null,
    filerefImg varchar (200) not null,
    urlImg varchar(200) not null,
    estado BOOLEAN not null,
    idCategoriaRecurso varchar (100) not null,
    FOREIGN KEY (idCategoriaRecurso) REFERENCES categoriaRecurso(idCategoriaRecurso)
);

CREATE TABLE recursosActividad(
    idRecursosActividad varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    idActividad varchar (100) not null,
    idRecurso varchar(100) not null,
    FOREIGN KEY (idActividad) REFERENCES actividad(idActividad),
    FOREIGN KEY (idRecurso) REFERENCES recurso(idRecurso)
);

CREATE TABLE personal(
    idPersonal varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    nombre varchar(70) not null,
    apellidos varchar(70) not null,
    celular int(8) not null,
    direccion varchar(150) not null,
    correo  varchar(100) not null,
    activo BOOLEAN not null,
    cargo varchar(50) not null,--ACA NACE UNA CONSULTA, VAMOS A CREAR LA TABLA CARGOS? O SERA ASI NOMAS LO Q INGRESEN, PARA VOLVERLO ID CARGO
    sueldo float not null,
    moneda varchar(3) not null,
    filerefCont varchar(200) not null,
    urlCont varchar(200) not null
);

CREATE TABLE documentoProyecto (
    idDocumentoProyecto varchar(100) PRIMARY KEY,
    creadoEn timestamp  default current_timestamp not null,
    idProyecto varchar(100) not null,
    idPersonal varchar(100) not null,
    filerefCont varchar(200) not null,
    urlCont varchar(200) not null,
    FOREIGN KEY (idProyecto) REFERENCES proyecto(idProyecto),
    FOREIGN KEY (idPersonal) REFERENCES personal(idPersonal)
);



-- algunas querys que serviran mas adelante
-- Recuperar categorias asignadas a un proyecto especifico
SELECT c.nombre
FROM categoriaasignadaproyecto as catA
INNER JOIN categoriaproyecto as c ON c.idCategoriaProyecto = catA.idCategoria
WHERE catA.idCategoria = c.idCategoriaProyecto AND catA.idProyecto = ?;