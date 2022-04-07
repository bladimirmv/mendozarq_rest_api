create table capitulopresupuesto
(
    uuid                varchar(100)                          not null
        primary key,
    creadoEn            timestamp default current_timestamp() not null,
    nombre              text                                  not null,
    descuento           int       default 0                   not null,
    uuidPresupuestoObra varchar(100)                          not null,
    constraint capitulopresupuesto_ibfk_1
        foreign key (uuidPresupuestoObra) references presupuestoobra (uuid)
            on delete cascade
);

create index uuidPresupuestoObra
    on capitulopresupuesto (uuidPresupuestoObra);

INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('0867e0f0-2cef-4cf6-9c97-43bb9b2bf300', '2022-03-31 21:48:23', 'Instalación de agua', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('0b8054d9-6acd-498e-ad8b-fe60c6fb836c', '2022-04-02 20:18:21', 'Cielorraso', 0, 'b4961720-0113-47b7-8bb7-06203e3b5c1b');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('0d88ad6c-9969-459e-b783-9f8090139d1c', '2022-03-31 21:48:23', 'Estructura de Hormigón - Piso de Hormigón', 3, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('1b6fada0-d017-4a2e-9caf-df8039cf7415', '2022-03-31 21:48:23', 'Cielorraso', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('1d3debb0-896b-47d2-93fe-a91a8652bfe2', '2022-03-30 17:49:38', 'Carpintería', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('2a3b23e5-3385-4327-a803-ea80a19baed3', '2022-03-30 17:48:01', 'Piso Poliretanico', 1, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('2c90df14-b962-4dd2-be4f-4f06ebc17dde', '2022-03-31 21:48:23', 'Limpieza de obra', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('3191b6e8-f84f-4bd9-8f7b-3116d89f30a4', '2022-03-30 17:49:45', 'Instalación Eléctrica', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('34ef8c42-85b1-4026-8de8-d78f5ac31550', '2022-03-30 17:47:28', 'Demoliciones', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('43baf6dc-5410-46da-898f-72e273d89030', '2022-03-31 21:48:23', 'Demoliciones', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('49b0aa81-f4e8-4a3d-9aa7-cd6208f30689', '2022-03-30 17:47:41', 'Desagüe Industrial', 3, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('4c7b80ce-2db0-48c7-b96b-499d34e25d8f', '2022-03-31 21:48:23', 'Desagüe Industrial', 3, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('54408d6e-f7a6-4347-b7f0-b4edba0aa90e', '2022-03-31 21:48:23', 'Piso Poliretanico', 1, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('63c6be32-c9df-473b-9fa9-c068765ded0c', '2022-03-30 17:47:17', 'Tareas Previas', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('6a0a8817-a570-4f47-b3f9-72b88dbc3ad2', '2022-03-31 21:48:23', 'Pintura', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('9db9179d-2927-4d13-b15d-b17a389008bc', '2022-03-30 17:49:53', 'Instalación de agua', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('9f31619a-6441-442e-ace3-acf09f3087f1', '2022-03-31 21:48:23', 'Instalación Eléctrica', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('a4c20d02-6161-44a7-bfb0-5db4459d5bf4', '2022-03-31 21:48:23', 'Revestimientos', 2, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('ac4f8ef6-aea4-4ccf-8b53-6e80a687cfb0', '2022-03-30 17:50:00', 'Pintura', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('b3be546e-62c4-478a-a556-51197e25a3f2', '2022-03-30 17:48:10', 'Mampostería piso de hormigón', 30, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('b91a9b5c-7440-4807-b661-8bb086395c0f', '2022-03-30 17:49:13', 'Revoques', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('c884b424-64e7-4e29-b6a0-77f3e611129b', '2022-03-31 21:48:23', 'Mampostería piso de hormigón', 30, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('c96ec13a-e65a-4718-838b-4f40abc07a5d', '2022-03-31 21:48:23', 'Tareas Previas', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('cf926cbf-3410-462a-a63a-0f24f4c7ecf1', '2022-03-31 21:48:23', 'Revoques', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('d519aadf-d75f-4def-bdf6-4d3856efa381', '2022-04-02 20:16:36', 'Carpintería', 0, 'b4961720-0113-47b7-8bb7-06203e3b5c1b');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('d69f0aa3-a583-488e-af05-a25c9169409b', '2022-03-30 17:50:07', 'Limpieza de obra', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('da0094f1-e3eb-412a-b2ea-f8483eadfe28', '2022-03-30 17:49:21', 'Revestimientos', 2, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('dd5df8f4-a389-4fdc-a013-7ef6ae727a72', '2022-03-31 21:48:23', 'Carpintería', 0, '5185e058-4571-47fd-abd8-84ba0fa9c633');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('eda9d0b4-f7fa-4c6b-8888-f3f941e6bfbf', '2022-03-30 17:49:31', 'Cielorraso', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('f8386c9c-d897-480d-a37d-92408da6cb1a', '2022-03-30 17:47:51', 'Estructura de Hormigón - Piso de Hormigón', 3, 'e0251f45-2ddf-4096-872a-99c319a09b40');
