create table detallecapitulo
(
    uuid                    varchar(100)                          not null
        primary key,
    creadoEn                timestamp default current_timestamp() not null,
    descripcion             text                                  not null,
    unidad                  varchar(10)                           not null,
    cantidad                int                                   not null,
    precioUnitario          decimal(15, 2)                        not null,
    uuidCapituloPresupuesto varchar(100)                          not null,
    constraint detallecapitulo_ibfk_1
        foreign key (uuidCapituloPresupuesto) references capitulopresupuesto (uuid)
            on delete cascade
);

create index uuidCapituloPresupuesto
    on detallecapitulo (uuidCapituloPresupuesto);

