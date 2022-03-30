create table log_proyecto
(
    operacion     char                                  not null,
    creadoEn      timestamp default current_timestamp() not null on update current_timestamp(),
    creadoPor     text                                  null,
    uuidCreadoPor text                                  null,
    hostname      text                                  null,
    tabla         text      default 'proyecto'          not null,
    path          text      default 'mendozarq'         not null,
    uuidRow       varchar(100)                          not null
);

INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-12 22:33:16', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-01-12 22:34:27', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '2506c130-7622-4ef7-92b3-4fb2be6080e0');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-01-12 22:34:37', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '2506c130-7622-4ef7-92b3-4fb2be6080e0');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('D', '2022-01-12 22:34:42', 'sergio olivé lerma', '35f44215-b58f-491e-a439-4b39ea044442', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '2506c130-7622-4ef7-92b3-4fb2be6080e0');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-08 23:42:49', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-08 23:43:56', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-09 20:49:14', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-11 13:58:45', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-11 13:59:05', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-11 14:00:07', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('U', '2022-02-11 14:00:37', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '13f3af68-d552-4c54-bde6-816f474dd4ec');
INSERT INTO mendozarq.log_proyecto (operacion, creadoEn, creadoPor, uuidCreadoPor, hostname, tabla, path, uuidRow) VALUES ('I', '2022-02-15 18:35:38', 'bladimir medrano vargas', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72', 'DESKTOP-0D2F255', 'proyecto', 'mendozarq', '5f1c430d-cda9-4ee8-aa58-b011c3544567');
