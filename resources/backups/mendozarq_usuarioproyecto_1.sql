create table usuarioproyecto
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    uuidProyecto varchar(100)                          not null,
    uuidUsuario  varchar(100)                          not null,
    constraint usuarioproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid),
    constraint usuarioproyecto_ibfk_2
        foreign key (uuidUsuario) references usuario (uuid)
);

create index uuidProyecto
    on usuarioproyecto (uuidProyecto);

create index uuidUsuario
    on usuarioproyecto (uuidUsuario);

INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('067d431f-a5ac-4fc7-b9ba-cda3c8770f0f', '2022-02-17 14:59:55', '13f3af68-d552-4c54-bde6-816f474dd4ec', '36f1f6d4-163d-4856-a964-aae308769f27');
INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('453ff224-54b9-4161-87c3-03817ca8f1d2', '2022-02-17 14:59:55', '13f3af68-d552-4c54-bde6-816f474dd4ec', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('d07f7ce0-8020-4f7e-9c64-688d85f0004b', '2022-02-17 14:59:55', '13f3af68-d552-4c54-bde6-816f474dd4ec', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
