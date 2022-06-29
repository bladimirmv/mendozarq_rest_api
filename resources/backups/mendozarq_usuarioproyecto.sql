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

INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('82c1c33c-3d49-47b7-bae9-16c8f217df6c', '2022-06-28 22:23:35', '92914a40-8a91-495b-9b6a-b46c491c317e', 'fa27b5b3-837b-4486-b2cd-c6a306e8bd72');
INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('87d472d8-e7c5-4165-aa50-a77173a1e4d0', '2022-06-28 22:23:35', '92914a40-8a91-495b-9b6a-b46c491c317e', '36f1f6d4-163d-4856-a964-aae308769f27');
INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('e4914caa-cad6-4451-958c-370bcb1cb436', '2022-06-28 22:23:35', '92914a40-8a91-495b-9b6a-b46c491c317e', '35f44215-b58f-491e-a439-4b39ea044442');
INSERT INTO mendozarq.usuarioproyecto (uuid, creadoEn, uuidProyecto, uuidUsuario) VALUES ('fc9fa744-0c3c-40e3-96b6-488c77063180', '2022-06-28 22:23:35', '92914a40-8a91-495b-9b6a-b46c491c317e', '81f19377-6c68-4bdc-9e38-d1c47b68c0c6');
