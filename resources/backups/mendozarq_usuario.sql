create table usuario
(
    uuid            varchar(100)                          not null
        primary key,
    creadoEn        timestamp default current_timestamp() not null,
    nombre          varchar(50)                           not null,
    apellidoPaterno varchar(50)                           not null,
    apellidoMaterno varchar(50)                           null,
    celular         int                                   null,
    direccion       text                                  null,
    correo          varchar(100)                          null,
    username        varchar(50)                           not null,
    contrasenha     varchar(100)                          not null,
    rol             varchar(20)                           not null,
    activo          tinyint(1)                            not null
);

INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('0976bfba-6a2a-4405-8bfe-2474a21f1e25', '2021-11-24 20:30:52', 'evaristo', 'del', 'gelabert', 67891432, '3896 Gil Ferrocarril
', 'Lilia_Anaya@corpfolder.com', 'evari8pni9', '$2b$10$56JrCWb4S9Zx1.GT9WdwCuNdH5jnFQcwQgKUXqbtLGQvZ2JrsUVSa', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('178e1faa-b3f0-4900-a7b5-a19085c0cf9c', '2021-11-24 20:29:26', 'salomón', 'ruano', '', 72686187, '4265 Korta hernandez Vía Pública
', 'Francisco_Santana@yahoo.com', 'salomo1ydq', '$2b$10$MKlyLpWKHpnwOglfWDOMfeCnT0zwwFKXPEnWbyb7WZvyGTxo0HCiu', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('2319b069-bde2-452c-af94-ec08f68c722c', '2021-11-24 20:39:52', 'leandra', 'villa', 'jordán', 74568926, '817 Tamayo Grupo
', 'XimenaGuadalupe18@yahoo.com', 'leandhbal2', '$2b$10$IN951.qE1yf.gHGRTlZp6.2ymwuyZmflQhmtd/xFjNb0ntGXpxF4m', 'vendedor', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('35f44215-b58f-491e-a439-4b39ea044442', '2021-11-24 20:42:26', 'sergio', 'olivé', 'lerma', 70045451, '9431 Contreras Puente
', 'Aarn.Gaitn22@example.com', 'sergimbswp', '$2b$10$ix0pSZUTSrJPnXcMfRxsCeuwS8RgwaEXRojgpxf.dD.yP2Ulsi1N2', 'administrador', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('36f1f6d4-163d-4856-a964-aae308769f27', '2021-11-24 20:39:06', 'severiano', 'peña', 'campillo', 66365952, '3803 Miranda Vía Pública
', 'Jorge.Tello@corpfolder.com', 'severx0md2', '$2b$10$To8MZqCW0e6oYkvWzHAhPukq20Loln7Y6PPrBbaAJ9gV.mOepPjym', 'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('4655d3ef-55cb-4579-9776-7f39377f5368', '2021-11-24 20:34:38', 'josé', 'figueroa', 'ibáñez', 62256672, '931 Miranda Rambla
', 'Gabriela_Zelaya97@gmail.com', 'joséijvxca', '$2b$10$h0hwzjwGhhLlQDgosMOfM.fwVWmSatBoQ3VY1Yv6dp1Chi0oP8f.G', 'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('665d2f27-32f8-4ac2-81fc-f972bcfdce78', '2021-11-24 20:37:57', 'evangelina', 'molina', 'mercader', 66383117, '077 Negrete Gran Subida
', 'JosAntonio_Cazares68@hotmail.com', 'evang2vu74', '$2b$10$ttZEYszXxEAIMJv9J23bOuSQ9c1LNsKRLa5HGcvlphXC0z7D1YYRK', 'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('7a617f2c-0ca0-49be-a3f0-e77555174af0', '2021-11-24 20:30:03', 'máximo', 'acedo', 'morillo', 72807533, '2311 Rosado Pasaje
', 'Toms_Quintana25@corpfolder.com', 'máximcrvd7', '$2b$10$JjJc.uMBp1qckLkFtTreueK2c6i6Rk9vJ4Ugp16Y9FyyYA66O6t8O', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('7ec2091c-abf2-4025-a207-3bbf04a5a8b9', '2021-11-24 20:33:29', 'elodia', 'falcón', 'larrañaga', 68966636, '1757 Juárez Senda
', 'Dorotea92@corpfolder.com', 'elodib0825', '$2b$10$NF6FJ62itir9Mbqqdl3YBeZSoaiMzz3FgihI/w0tsw9Sb4SwVe2ie', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('81ed9811-5b7a-4316-8e9d-7081df740265', '2021-11-24 20:28:59', 'lina', 'sáenz', 'ribes', 78389801, '4988 Mondragón Rincón
', 'Blanca_Orellana63@corpfolder.com', 'lina1tpy7e', '$2b$10$W14t6MNoWIk5XHGUrra.GeSDtGXl6Bkk43sc7Wa1T1AvdF./6erX.', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('81f19377-6c68-4bdc-9e38-d1c47b68c0c6', '2021-11-24 20:38:31', 'néstor', 'almazán', 'azorin', 64046915, '98208 Yamileth Grupo
', 'Mariana97@yahoo.com', 'nésto42u7t', '$2b$10$GEtu3VwvQjwcAuRbSjpzguT1ry5py7mCx0hVL/T68kVtsD3DMKKtC', 'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('8faf0153-fd37-4096-ba58-5592c24eed5a', '2021-11-24 20:35:34', 'dafne', 'escamilla', 'miralles', 63598297, '6104 Aranda Manzana
', 'Mercedes.Ayala1@nearbpo.com', 'dafne44lha', '$2b$10$PCG9pfLytv7.6MszgE13N.aMTdDGhvEe8GiHbZaq8HXgPa/bc51z6', 'arquitecto', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('942246e6-f202-47f9-9db6-c067a33707eb', '2021-11-24 20:28:01', 'celia', 'cerdán', 'benavides', 64859213, '45267 Roldán Subida
', 'Anita10@corpfolder.com', 'celia4w8yf', '$2b$10$4SXxEZImtgfJzKvWjI9dj.9.ThA91zs94tr9LPOiLmGl8wQM4k54W', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('a5b86b62-0ef8-4d23-a2f8-a242daa25103', '2021-11-24 20:31:43', 'angelino octavio', 'pintor', 'benavides', 70283107, '1953 Axel Huerta
', 'Rosario_Narvez@hotmail.com', 'angelleftz', '$2b$10$qfGFexEXzfnl/jR4QMHR8u7xg2fuoJ15302yvD7yi0cS1dtKR3eli', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('b47217c5-fb5c-4441-9dd1-912d9d6e64e2', '2022-03-13 13:58:05', 'DSAD', 'DSADSA', 'DSADSA', 3213123, 'SADASSA', 'DSA@GMNA.DSA', 'DSAD1a5kww', '$2b$10$6yXptVFI5l5CvovIJBt2YOxaeZiQrJxNs7raM8U9vsn3YUxi5fZ8a', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('bf493a64-4573-433f-92b0-edbcae73a98b', '2021-11-24 20:45:00', 'carmelita', 'cabrero', 'castillo', 75176717, '81863 Pelayo Parque
', 'Mercedes67@yahoo.com', 'carmeky8ka', '$2b$10$EIF49KhYeBkJ4TEcFxQE8OKqMWrjXelHVLCfUQrXEjkpqCodPn1T6', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('ce754db3-3b9c-4dd5-81f1-ae2b5f5a060a', '2021-11-24 20:27:02', 'juan', 'sobrino', 'suárez', 68101913, '77864 Enrique Colonia', 'Diego82@corpfolder.com', 'juannwfqjc', '$2b$10$EXWxE8u0VCeScF8pbeP4Me0.1JqHYdXVO4Fp2jbLxdmJj/ASVZ.cu', 'cliente', 1);
INSERT INTO mendozarq.usuario (uuid, creadoEn, nombre, apellidoPaterno, apellidoMaterno, celular, direccion, correo, username, contrasenha, rol, activo) VALUES ('fa27b5b3-837b-4486-b2cd-c6a306e8bd72', '2021-11-24 20:40:00', 'bladimir', 'medrano', 'vargas', 69509449, 'Av segunda entre marina nunez del prado y calle greco.', 'bladimilmedranoblod@gmail.com', 'blado959', '$2b$10$Ejt7X/epAQ2kfChOFJa9T.apOjSfTR2xkMWOoIfWWKT4JFh8CDu.C', 'administrador', 1);
