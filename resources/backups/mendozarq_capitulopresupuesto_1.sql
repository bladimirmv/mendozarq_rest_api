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

INSERT INTO mendozarq.capitulopresupuesto (uuid, creadoEn, nombre, descuento, uuidPresupuestoObra) VALUES ('da8f2ff1-723d-41fa-9211-63146694b1f0', '2022-03-19 16:56:02', 'dsadsad', 0, 'e0251f45-2ddf-4096-872a-99c319a09b40');
