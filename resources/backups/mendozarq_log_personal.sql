create table log_personal
(
    operacion     char                                  not null,
    creadoEn      timestamp default current_timestamp() not null on update current_timestamp(),
    creadoPor     text                                  null,
    uuidCreadoPor text                                  null,
    hostname      text                                  null,
    tabla         text      default 'personal'          not null,
    path          text      default 'mendozarq'         not null,
    uuidRow       varchar(100)                          not null
);

INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:10', '', '', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-05-24 11:54:10', '', '', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '6739cd0f-9e3e-4eb2-9c22-e2a60be68401');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-11 18:01:36', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-11 18:01:53', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'eb2428e5-42d2-4ec0-bad7-4c7f50b11fcf');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-11 18:01:57', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'eb2428e5-42d2-4ec0-bad7-4c7f50b11fcf');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-11 19:31:59', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-11 19:32:09', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-11 19:32:20', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-11 19:33:06', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'ea20f106-3301-4449-8acd-f5cddab39366');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-11 19:36:53', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'ea20f106-3301-4449-8acd-f5cddab39366');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-11 19:37:09', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'd8eb8089-3fc3-4950-b078-9f25679a6541');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-11 19:37:18', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'ea20f106-3301-4449-8acd-f5cddab39366');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 11:25:24', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '6a08128f-06eb-432e-975d-9f43ee21c69a');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 11:30:19', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', 'd8eb8089-3fc3-4950-b078-9f25679a6541');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 11:30:19', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '6a08128f-06eb-432e-975d-9f43ee21c69a');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-08 23:35:12', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-08 23:35:20', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '0cdca13f-175a-4ed0-8320-650f65bf9167');
INSERT INTO mendozarq.log_personal (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-03-30 23:30:25', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'personal', 'mendozarq', '6739cd0f-9e3e-4eb2-9c22-e2a60be68401');
