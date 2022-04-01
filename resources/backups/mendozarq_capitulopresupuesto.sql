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
);

create index uuidPresupuestoObra
    on capitulopresupuesto (uuidPresupuestoObra);

INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('1d3debb0-896b-47d2-93fe-a91a8652bfe2', '2022-03-30 17:49:38', 'Carpintería', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('2a3b23e5-3385-4327-a803-ea80a19baed3', '2022-03-30 17:48:01', 'Piso Poliretanico', 1, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('3191b6e8-f84f-4bd9-8f7b-3116d89f30a4', '2022-03-30 17:49:45', 'Instalación Eléctrica', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('34ef8c42-85b1-4026-8de8-d78f5ac31550', '2022-03-30 17:47:28', 'Demoliciones', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('49b0aa81-f4e8-4a3d-9aa7-cd6208f30689', '2022-03-30 17:47:41', 'Desagüe Industrial', 3, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('63c6be32-c9df-473b-9fa9-c068765ded0c', '2022-03-30 17:47:17', 'Tareas Previas', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('9db9179d-2927-4d13-b15d-b17a389008bc', '2022-03-30 17:49:53', 'Instalación de agua', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('ac4f8ef6-aea4-4ccf-8b53-6e80a687cfb0', '2022-03-30 17:50:00', 'Pintura', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('b3be546e-62c4-478a-a556-51197e25a3f2', '2022-03-30 17:48:10', 'Mampostería piso de hormigón', 30, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('b91a9b5c-7440-4807-b661-8bb086395c0f', '2022-03-30 17:49:13', 'Revoques', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('d69f0aa3-a583-488e-af05-a25c9169409b', '2022-03-30 17:50:07', 'Limpieza de obra', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('da0094f1-e3eb-412a-b2ea-f8483eadfe28', '2022-03-30 17:49:21', 'Revestimientos', 2, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('eda9d0b4-f7fa-4c6b-8888-f3f941e6bfbf', '2022-03-30 17:49:31', 'Cielorraso', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('f8386c9c-d897-480d-a37d-92408da6cb1a', '2022-03-30 17:47:51', 'Estructura de Hormigón - Piso de Hormigón', 3, 'e0251f45-2ddf-4096-872a-99c319a09b40');
