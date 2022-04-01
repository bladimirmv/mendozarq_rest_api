create table log_usuario
(
    operacion     char                                  not null,
    creadoEn      timestamp default current_timestamp() not null on update current_timestamp(),
    creadoPor     text                                  null,
    uuidCreadoPor text                                  null,
    hostname      text                                  null,
    tabla         text      default 'usuario'           not null,
    path          text      default 'mendozarq-liraki'  not null,
    uuidRow       varchar(100)                          not null
);

INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:20:27', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'e3f1efed-b797-4c87-9f95-ae0a78a43384');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2021-12-27 17:22:48', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'c2af07dc-a31c-463f-b7db-a36191c6b2f3');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:23:20', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'c2af07dc-a31c-463f-b7db-a36191c6b2f3');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2021-12-27 17:23:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'c2af07dc-a31c-463f-b7db-a36191c6b2f3');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2021-12-27 17:23:34', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'e3f1efed-b797-4c87-9f95-ae0a78a43384');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2021-12-27 17:25:27', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'a5309073-b7ea-4916-8c04-f553e731cab7');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:25:48', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:27:24', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2021-12-27 17:27:50', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'd35a9834-8b89-4ad1-a266-0eafa35c3d22');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2021-12-27 17:27:55', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'd35a9834-8b89-4ad1-a266-0eafa35c3d22');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:33:12', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:33:23', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:39:27', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:39:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:40:05', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:40:43', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:41:14', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:41:54', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:42:12', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:43:47', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-27 17:47:33', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-29 23:44:04', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2021-12-31 22:15:49', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-02 23:46:33', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-02 23:46:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-17 12:29:39', null, null, 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-10 20:39:03', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-17 14:39:03', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-22 14:53:42', null, null, 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-22 14:54:08', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-22 14:54:33', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-03-13 13:58:05', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'b47217c5-fb5c-4441-9dd1-912d9d6e64e2');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-03-27 11:48:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'b47217c5-fb5c-4441-9dd1-912d9d6e64e2');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-27 11:55:41', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-27 11:55:55', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-27 18:20:12', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-27 18:20:22', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-27 18:24:34', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-28 10:08:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-28 13:20:10', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-28 13:24:11', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-28 13:24:45', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-30 12:26:08', 'carmelita cabrero castillo', 'bf493a64-4573-433f-92b0-edbcae73a98b', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-31 22:26:25', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '36f1f6d4-163d-4856-a964-aae308769f27');
INSERT INTO mendozarq.log_usuario (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-03-31 22:27:23', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '2319b069-bde2-452c-af94-ec08f68c722c');
