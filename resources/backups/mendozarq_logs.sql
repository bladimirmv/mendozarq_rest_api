create definer = root@localhost view logs as
select `mendozarq`.`log_usuario`.`operacion`     AS `operacion`,
       `mendozarq`.`log_usuario`.`creadoEn`      AS `creadoEn`,
       `mendozarq`.`log_usuario`.`creadoPor`     AS `creadoPor`,
       `mendozarq`.`log_usuario`.`uuidCreadoPor` AS `uuidCreadoPor`,
       `mendozarq`.`log_usuario`.`hostname`      AS `hostname`,
       `mendozarq`.`log_usuario`.`tabla`         AS `tabla`,
       `mendozarq`.`log_usuario`.`path`          AS `path`,
       `mendozarq`.`log_usuario`.`uuidRow`       AS `uuidRow`
from `mendozarq`.`log_usuario`
union
select `mendozarq`.`log_personal`.`operacion`     AS `operacion`,
       `mendozarq`.`log_personal`.`creadoEn`      AS `creadoEn`,
       `mendozarq`.`log_personal`.`creadoPor`     AS `creadoPor`,
       `mendozarq`.`log_personal`.`uuidCreadoPor` AS `uuidCreadoPor`,
       `mendozarq`.`log_personal`.`hostname`      AS `hostname`,
       `mendozarq`.`log_personal`.`tabla`         AS `tabla`,
       `mendozarq`.`log_personal`.`path`          AS `path`,
       `mendozarq`.`log_personal`.`uuidRow`       AS `uuidRow`
from `mendozarq`.`log_personal`
union
select `mendozarq`.`log_proyecto`.`operacion`     AS `operacion`,
       `mendozarq`.`log_proyecto`.`creadoEn`      AS `creadoEn`,
       `mendozarq`.`log_proyecto`.`creadoPor`     AS `creadoPor`,
       `mendozarq`.`log_proyecto`.`uuidCreadoPor` AS `uuidCreadoPor`,
       `mendozarq`.`log_proyecto`.`hostname`      AS `hostname`,
       `mendozarq`.`log_proyecto`.`tabla`         AS `tabla`,
       `mendozarq`.`log_proyecto`.`path`          AS `path`,
       `mendozarq`.`log_proyecto`.`uuidRow`       AS `uuidRow`
from `mendozarq`.`log_proyecto`
union
select `mendozarq`.`log_documentos`.`operacion`     AS `operacion`,
       `mendozarq`.`log_documentos`.`creadoEn`      AS `creadoEn`,
       `mendozarq`.`log_documentos`.`creadoPor`     AS `creadoPor`,
       `mendozarq`.`log_documentos`.`uuidCreadoPor` AS `uuidCreadoPor`,
       `mendozarq`.`log_documentos`.`hostname`      AS `hostname`,
       `mendozarq`.`log_documentos`.`tabla`         AS `tabla`,
       `mendozarq`.`log_documentos`.`path`          AS `path`,
       `mendozarq`.`log_documentos`.`uuidRow`       AS `uuidRow`
from `mendozarq`.`log_documentos`
union
select `mendozarq`.`log_producto`.`operacion`     AS `operacion`,
       `mendozarq`.`log_producto`.`creadoEn`      AS `creadoEn`,
       `mendozarq`.`log_producto`.`creadoPor`     AS `creadoPor`,
       `mendozarq`.`log_producto`.`uuidCreadoPor` AS `uuidCreadoPor`,
       `mendozarq`.`log_producto`.`hostname`      AS `hostname`,
       `mendozarq`.`log_producto`.`tabla`         AS `tabla`,
       `mendozarq`.`log_producto`.`path`          AS `path`,
       `mendozarq`.`log_producto`.`uuidRow`       AS `uuidRow`
from `mendozarq`.`log_producto`
order by `creadoEn` desc
limit 100;

INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-16 17:02:06', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '46445a16-b0e9-4200-a080-3cf1cd20cca0');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:57:11', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '69ad9459-0273-46a9-a312-e5b7d8952e86');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:56:57', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:54:38', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '69ad9459-0273-46a9-a312-e5b7d8952e86');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:53:01', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:51:55', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:49:44', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:43:42', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:43:04', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:43:04', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:43:00', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-06-16 16:42:55', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '841d91d1-10dd-43c0-b4d2-fc9e6c375428');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:40:20', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:40:20', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:40:13', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:40:13', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:39:45', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:39:45', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:36:10', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:36:10', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:36:04', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:36:04', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:35:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:35:53', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:35:35', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:35:35', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-16 16:28:34', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '841d91d1-10dd-43c0-b4d2-fc9e6c375428');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-16 16:25:28', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '69ad9459-0273-46a9-a312-e5b7d8952e86');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-16 16:24:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '69ad9459-0273-46a9-a312-e5b7d8952e86');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-16 16:21:38', null, null, 'DESKTOP-0D2F255', 'producto', 'liraki', 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-15 23:01:28', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'dea18ab5-3cd2-4626-bcff-ef4126af7303');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-15 22:57:10', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '0ffbfaa6-a0f3-4374-afda-a7dee8bd8618');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-15 22:56:52', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '0ffbfaa6-a0f3-4374-afda-a7dee8bd8618');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-15 22:51:02', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '9104aded-4387-44dd-a95d-850445433181');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-15 22:48:42', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '9104aded-4387-44dd-a95d-850445433181');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-15 22:44:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '9104aded-4387-44dd-a95d-850445433181');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-15 22:34:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-15 22:04:24', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-15 19:20:34', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'a23de6cb-54a0-475e-acfd-975c36de336e');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-10 22:41:33', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '4cc90ad9-5e15-436d-8106-bf3cddd1ab41');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-10 22:36:34', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '4cc90ad9-5e15-436d-8106-bf3cddd1ab41');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-10 22:31:35', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '6dd0e270-fb5c-4e27-ab6f-c8e79c258047');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-10 22:31:28', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '4b9e4a99-2619-4805-ac41-0428dc4bce45');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-10 22:31:04', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '4b9e4a99-2619-4805-ac41-0428dc4bce45');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-10 14:12:30', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '6dd0e270-fb5c-4e27-ab6f-c8e79c258047');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-10 14:11:31', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '6dd0e270-fb5c-4e27-ab6f-c8e79c258047');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-10 14:06:20', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd2bd9d15-1039-4444-8dcf-082592157bdd');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-10 11:54:55', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd2bd9d15-1039-4444-8dcf-082592157bdd');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-06-10 11:49:09', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '2a04a96f-5b41-4140-ab9a-94ed38a75d6e');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-06-10 11:47:16', null, null, 'DESKTOP-0D2F255', 'producto', 'liraki', '2a04a96f-5b41-4140-ab9a-94ed38a75d6e');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-30 10:33:35', null, null, 'DESKTOP-0D2F255', 'producto', 'liraki', 'a35424cc-fd28-44ac-a604-4c4b2d628f43');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-30 10:33:35', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '24a102fe-58cf-4de1-9063-1db1c75d9eb4');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-30 10:33:35', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7bd5774f-6174-48a9-b456-ed132353885a');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-30 10:33:35', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '447bac09-6ed6-48cb-9d43-321833b91eee');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-30 10:33:35', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '006fe36f-1f53-49c6-b5d6-5dcca6571d42');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-30 10:33:35', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'decda335-f5d2-4987-96bf-79794f1462ab');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-30 10:33:35', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b30ac8ef-ad14-477e-9f57-0fa0eba5d71d');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-30 10:33:35', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-30 10:33:35', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'cb099636-c1c2-44d5-8c25-8d18cf619e23');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-30 10:33:35', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '410b5731-4c04-4262-a734-b5c03c140569');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-26 15:50:24', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '95925ddf-95ff-4e5e-82a8-8d98cb5c7790');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-26 14:36:22', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '02cea732-e77c-4546-b841-0fd048f15d0c');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:32:24', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b1cb4347-9792-4454-b9f6-a8b5db3e9ee9');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-26 14:31:47', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b1cb4347-9792-4454-b9f6-a8b5db3e9ee9');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:28:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'fdf00dc4-cb2b-42a0-9b63-46132723946b');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:25:05', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'fdf00dc4-cb2b-42a0-9b63-46132723946b');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:25:00', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '72668ec0-19d6-4062-9477-45623f4f3f9a');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:24:54', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'c05c67f9-8333-4c0b-b170-4929a2661085');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:24:48', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '208dbcc3-caeb-401a-aec2-03c97db83495');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:24:40', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '0050a1a6-1ee2-4ad7-9685-8b8e6292e277');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:24:34', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:24:26', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '36d2421b-cbae-4dd3-aac7-4544efc9d6af');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:24:18', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:24:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:22:25', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:22:19', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '36d2421b-cbae-4dd3-aac7-4544efc9d6af');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:22:11', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:21:10', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '0050a1a6-1ee2-4ad7-9685-8b8e6292e277');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:21:00', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '208dbcc3-caeb-401a-aec2-03c97db83495');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:20:52', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'c05c67f9-8333-4c0b-b170-4929a2661085');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:20:40', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '72668ec0-19d6-4062-9477-45623f4f3f9a');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-26 14:20:19', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'fdf00dc4-cb2b-42a0-9b63-46132723946b');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:17:44', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '72668ec0-19d6-4062-9477-45623f4f3f9a');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-26 14:13:32', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '72668ec0-19d6-4062-9477-45623f4f3f9a');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-26 14:08:08', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'c05c67f9-8333-4c0b-b170-4929a2661085');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-26 14:05:11', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '208dbcc3-caeb-401a-aec2-03c97db83495');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:00:52', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-26 14:00:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '0050a1a6-1ee2-4ad7-9685-8b8e6292e277');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-26 14:00:05', null, null, 'DESKTOP-0D2F255', 'producto', 'liraki', '0050a1a6-1ee2-4ad7-9685-8b8e6292e277');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-25 16:07:40', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-25 16:04:12', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '36d2421b-cbae-4dd3-aac7-4544efc9d6af');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-25 15:56:23', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-25 15:54:12', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-25 15:53:41', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-25 15:40:23', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-25 14:35:15', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-25 14:14:32', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-25 14:11:59', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-25 14:11:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-25 14:10:24', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
