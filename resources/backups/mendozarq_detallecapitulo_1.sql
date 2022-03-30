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

INSERT INTO mendozarq.detallecapitulo (uuid, creadoEn, descripcion, unidad, cantidad, precioUnitario, uuidCapituloPresupuesto) VALUES ('18cea3e0-3caa-4724-97a9-d918a53390c5', '2022-03-19 16:56:07', 'dsadas', 'mm', 0, 0.00, 'da8f2ff1-723d-41fa-9211-63146694b1f0');
