create table observacionservicio
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    estado       varchar(100)                          not null,
    descripcion  varchar(200)                          not null,
    fecha        date                                  not null,
    uuidServicio varchar(100)                          not null,
    uuidVisita   varchar(100)                          not null,
    constraint observacionservicio_ibfk_1
        foreign key (uuidServicio) references servicioproyecto (uuid),
    constraint observacionservicio_ibfk_2
        foreign key (uuidVisita) references visitaproyecto (uuid)
);

create index uuidServicio
    on observacionservicio (uuidServicio);

create index uuidVisita
    on observacionservicio (uuidVisita);

INSERT INTO mendozarq.observacionservicio (uuid, creadoEn, estado, descripcion, fecha, uuidServicio, uuidVisita) VALUES ('875774e7-d5ce-47a3-9744-d65b04d3f766', '2022-06-29 10:18:54', 'Finalizado', 'Se finalizo la entrega del dia sin ninguna novedad. Entregas restantes 23', '2022-06-29', 'ea5b4d61-7cb1-4f8b-b2b1-e9b08e74e4f3', '2449f5ef-95fa-4d88-9050-5174ebdc30dd');
