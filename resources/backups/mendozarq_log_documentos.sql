create table log_documentos
(
    operacion     char                                  not null,
    creadoEn      timestamp default current_timestamp() not null on update current_timestamp(),
    creadoPor     text                                  null,
    uuidCreadoPor text                                  null,
    hostname      text                                  null,
    tabla         text      default 'documentos'        not null,
    path          text      default 'mendozarq'         not null,
    uuidRow       varchar(100)                          not null
);

INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-12 22:36:45', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '808d6b68-db2f-46d9-b58a-fdd522da1fee');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:25', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'a7680150-1213-4048-961e-6dea49772863');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:40', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'db7878c5-c66d-4d4d-b62f-b89a4123ac5c');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:40', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'd41aa38e-2bbd-4fd7-bd2e-2289cc290381');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:40', null, null, 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '410e2fc7-f88b-4b46-b5f8-de017ef478e0');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:59', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '694c97e2-f7ac-41a0-ac13-d6565ae4e022');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:59', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'dcf2f930-f372-4c80-80da-5d87142c5d34');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:38:59', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '4aa83608-70f8-44b9-9046-6217234a61a8');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:39:24', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '4aa83608-70f8-44b9-9046-6217234a61a8');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:39:29', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '694c97e2-f7ac-41a0-ac13-d6565ae4e022');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:39:32', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'dcf2f930-f372-4c80-80da-5d87142c5d34');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:39:35', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '410e2fc7-f88b-4b46-b5f8-de017ef478e0');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:39:37', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'd41aa38e-2bbd-4fd7-bd2e-2289cc290381');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:39:41', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'db7878c5-c66d-4d4d-b62f-b89a4123ac5c');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-17 11:34:10', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', 'a7680150-1213-4048-961e-6dea49772863');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-02-12 00:10:06', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '31e1a469-31a7-4a33-b2e6-ea4565318446');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-02-12 00:10:13', '', '', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '31e1a469-31a7-4a33-b2e6-ea4565318446');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-02-14 10:49:30', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '0e62490b-8444-48d1-80f0-0994595574bf');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-02-17 14:44:43', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '32db189a-2d87-45ff-9eb4-7a8cf78b2d17');
INSERT INTO mendozarq.log_documentos (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-02-17 14:44:44', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'documentos', 'mendozarq', '083fe6e4-aea9-4b65-883c-66384a0a0d43');
