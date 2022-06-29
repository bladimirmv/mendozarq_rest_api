create table servicioproyecto
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    nombre       varchar(50)                           not null,
    descripcion  varchar(200)                          null,
    avance       int                                   not null,
    fechaInicio  date                                  not null,
    fechaFinal   date                                  not null,
    uuidProyecto varchar(100)                          not null,
    constraint servicioproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidProyecto
    on servicioproyecto (uuidProyecto);

INSERT INTO mendozarq.servicioproyecto (uuid, creadoEn, nombre, descripcion, avance, fechaInicio, fechaFinal, uuidProyecto) VALUES ('ea5b4d61-7cb1-4f8b-b2b1-e9b08e74e4f3', '2022-06-28 22:30:53', 'hormigon coboce', 'hormigon de coboce para la construccion', 21, '2022-07-29', '2022-10-31', '92914a40-8a91-495b-9b6a-b46c491c317e');
