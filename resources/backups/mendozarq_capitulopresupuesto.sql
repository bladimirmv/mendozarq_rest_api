create table capitulopresupuesto
(
    uuid                varchar(100)                          not null
        primary key,
    creadoEn            timestamp default current_timestamp() not null,
    nombre              text                                  not null,
    descuento           int       default 0                   not null,
    uuidPresupuestoObra varchar(100)                          not null,
    constraint capitulopresupuesto_ibfk_1
        foreign key (uuidPresupuestoObra) references presupuestoobra (uuid)
);

create index uuidPresupuestoObra
    on capitulopresupuesto (uuidPresupuestoObra);

