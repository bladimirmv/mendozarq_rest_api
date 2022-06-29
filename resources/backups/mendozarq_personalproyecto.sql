create table personalproyecto
(
    uuid         varchar(100)                          not null
        primary key,
    creadoEn     timestamp default current_timestamp() not null,
    uuidProyecto varchar(100)                          not null,
    uuidPersonal varchar(100)                          not null,
    constraint personalproyecto_ibfk_1
        foreign key (uuidProyecto) references proyecto (uuid),
    constraint personalproyecto_ibfk_2
        foreign key (uuidPersonal) references personal (uuid)
);

create index uuidPersonal
    on personalproyecto (uuidPersonal);

create index uuidProyecto
    on personalproyecto (uuidProyecto);

INSERT INTO mendozarq.personalproyecto (uuid, creadoEn, uuidProyecto, uuidPersonal) VALUES ('6b532d16-a929-4abf-b8c6-88e44c523382', '2022-06-28 22:23:50', '92914a40-8a91-495b-9b6a-b46c491c317e', '471c2837-6d59-43c2-ac1e-81a56f7a3d03');
INSERT INTO mendozarq.personalproyecto (uuid, creadoEn, uuidProyecto, uuidPersonal) VALUES ('772490c5-95e5-4971-a803-ad39abea4caf', '2022-06-28 22:23:50', '92914a40-8a91-495b-9b6a-b46c491c317e', '6739cd0f-9e3e-4eb2-9c22-e2a60be68401');
INSERT INTO mendozarq.personalproyecto (uuid, creadoEn, uuidProyecto, uuidPersonal) VALUES ('c815cf0b-0d7b-452e-af7c-615173970fe3', '2022-06-28 22:23:50', '92914a40-8a91-495b-9b6a-b46c491c317e', 'a2f0a1c4-06d9-4459-9283-49cf3460f9e1');
INSERT INTO mendozarq.personalproyecto (uuid, creadoEn, uuidProyecto, uuidPersonal) VALUES ('d4a1e3c2-852e-4659-9ebd-cbb8ea6471ed', '2022-06-28 22:23:50', '92914a40-8a91-495b-9b6a-b46c491c317e', '122573dc-a098-45f7-8509-c54acf58e9c3');
INSERT INTO mendozarq.personalproyecto (uuid, creadoEn, uuidProyecto, uuidPersonal) VALUES ('f167f2cf-b7f4-4e48-b58c-293bddd5d8b0', '2022-06-28 22:23:50', '92914a40-8a91-495b-9b6a-b46c491c317e', '0cdca13f-175a-4ed0-8320-650f65bf9167');
