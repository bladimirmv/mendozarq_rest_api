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
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-25 13:48:46', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'a35424cc-fd28-44ac-a604-4c4b2d628f43');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-25 12:25:43', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'cb099636-c1c2-44d5-8c25-8d18cf619e23');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-25 10:29:12', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '410b5731-4c04-4262-a734-b5c03c140569');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-25 10:20:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b30ac8ef-ad14-477e-9f57-0fa0eba5d71d');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-25 10:20:17', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'b30ac8ef-ad14-477e-9f57-0fa0eba5d71d');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-25 00:32:05', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '006fe36f-1f53-49c6-b5d6-5dcca6571d42');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-25 00:26:44', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '006fe36f-1f53-49c6-b5d6-5dcca6571d42');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-25 00:25:26', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '006fe36f-1f53-49c6-b5d6-5dcca6571d42');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 23:54:54', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7bd5774f-6174-48a9-b456-ed132353885a');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 23:44:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7bd5774f-6174-48a9-b456-ed132353885a');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 23:19:43', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '7bd5774f-6174-48a9-b456-ed132353885a');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 23:18:40', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '7bd5774f-6174-48a9-b456-ed132353885a');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 22:39:14', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 22:39:09', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'decda335-f5d2-4987-96bf-79794f1462ab');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 22:39:03', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '447bac09-6ed6-48cb-9d43-321833b91eee');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 22:37:27', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 22:37:17', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'decda335-f5d2-4987-96bf-79794f1462ab');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 22:36:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '447bac09-6ed6-48cb-9d43-321833b91eee');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 22:36:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '24a102fe-58cf-4de1-9063-1db1c75d9eb4');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 22:35:13', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '24a102fe-58cf-4de1-9063-1db1c75d9eb4');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 22:31:47', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', '447bac09-6ed6-48cb-9d43-321833b91eee');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 22:31:17', '', '', 'DESKTOP-0D2F255', 'producto', 'liraki', '447bac09-6ed6-48cb-9d43-321833b91eee');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 22:27:28', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'decda335-f5d2-4987-96bf-79794f1462ab');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 22:27:02', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'decda335-f5d2-4987-96bf-79794f1462ab');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 21:50:20', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 21:49:47', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 21:46:54', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 21:39:54', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 21:39:34', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 21:39:18', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 21:37:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 21:13:16', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-05-24 21:12:04', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 17:40:15', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'producto', 'liraki', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:10', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '81f19377-6c68-4bdc-9e38-d1c47b68c0c6');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:10', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '8faf0153-fd37-4096-ba58-5592c24eed5a');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:10', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '942246e6-f202-47f9-9db6-c067a33707eb');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:10', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'a5b86b62-0ef8-4d23-a2f8-a242daa25103');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:10', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'bf493a64-4573-433f-92b0-edbcae73a98b');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:10', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'ce754db3-3b9c-4dd5-81f1-ae2b5f5a060a');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:10', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:10', '', '', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:10', '', '', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '6739cd0f-9e3e-4eb2-9c22-e2a60be68401');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:09', null, null, 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '0976bfba-6a2a-4405-8bfe-2474a21f1e25');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:09', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '178e1faa-b3f0-4900-a7b5-a19085c0cf9c');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:09', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '2319b069-bde2-452c-af94-ec08f68c722c');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:09', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:09', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '36f1f6d4-163d-4856-a964-aae308769f27');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:09', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '4655d3ef-55cb-4579-9776-7f39377f5368');
INSERT INTO mendozarq.logs (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:09', '', '', 'DESKTOP-0D2F255', 'usuario', 'mendozarq-liraki', '665d2f27-32f8-4ac2-81fc-f972bcfdce78');
