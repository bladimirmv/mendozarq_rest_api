create table presupuestoproyecto
(
    uuid                varchar(100)                          not null
        primary key,
    creadoEn            timestamp default current_timestamp() not null,
    uuidPresupuestoObra varchar(100)                          not null,
    uuidProyecto        varchar(100)                          not null,
    constraint presupuestoproyecto_ibfk_1
        foreign key (uuidPresupuestoObra) references presupuestoobra (uuid),
    constraint presupuestoproyecto_ibfk_2
        foreign key (uuidProyecto) references proyecto (uuid)
);

create index uuidPresupuestoObra
    on presupuestoproyecto (uuidPresupuestoObra);

create index uuidProyecto
    on presupuestoproyecto (uuidProyecto);

