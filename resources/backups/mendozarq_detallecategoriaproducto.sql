create table detallecategoriaproducto
(
    uuid          varchar(100) not null
        primary key,
    uuidCategoria varchar(100) null,
    uuidProducto  varchar(100) null,
    constraint detallecategoriaproducto_ibfk_1
        foreign key (uuidCategoria) references categoriaproducto (uuid),
    constraint detallecategoriaproducto_ibfk_2
        foreign key (uuidProducto) references producto (uuid)
            on delete cascade
);

create index uuidCategoria
    on detallecategoriaproducto (uuidCategoria);

create index uuidProducto
    on detallecategoriaproducto (uuidProducto);

INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('053a6545-ba8a-40c5-a2fb-85dea6fd2dac', '805ab00f-c607-42bc-9d20-60dfd58763db', '5e916855-3d48-46b5-b2ab-47cffea85be7');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('1bfa5879-f181-492c-9c47-b522fb3e5681', '718abba8-fd1d-490c-9ecc-81addc302a35', '890d6295-ad7a-481f-acf0-c608c5e7a9df');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('4453f1a4-464c-4152-8b2f-b21ea86d7401', '8f7a06df-bfd3-4fc4-92fb-12ee1e65250e', '2fe5ff3e-f808-4e6d-916a-d4959bb87227');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('4fbb4165-4930-42ff-96b2-56eb2edfaa16', '6a8376c6-319a-46dc-90fb-3410e4381b9e', '7d9ca4bb-b259-4ce2-b069-4893f074b597');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('579d012d-a88f-4e4b-a368-1fe79c1cba47', '718abba8-fd1d-490c-9ecc-81addc302a35', '7380f463-deb1-40ce-9f4f-7f5a959b6e32');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('5e3f34e3-60cc-4719-ad00-473bb4d8a899', '8f7a06df-bfd3-4fc4-92fb-12ee1e65250e', '7307299d-ec02-4f52-98d0-baf027033698');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('65284284-587a-4cc8-a0b7-17d296693097', '6a8376c6-319a-46dc-90fb-3410e4381b9e', '890d6295-ad7a-481f-acf0-c608c5e7a9df');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('6fdc55ef-d05a-4379-82d8-2155ea5a2540', '6a8376c6-319a-46dc-90fb-3410e4381b9e', '5e916855-3d48-46b5-b2ab-47cffea85be7');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('818135ef-a93b-4913-b1e3-78305bfe5415', '8cec5a20-206d-4b57-a021-24aa340f1f51', 'fa97335b-3efd-499d-9ec2-78c49597a301');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('8624c92c-6ba1-4c0a-ab6d-2a700201eec8', '718abba8-fd1d-490c-9ecc-81addc302a35', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('addc94b1-e2ef-4166-b5cc-91de0f30eec3', '8cec5a20-206d-4b57-a021-24aa340f1f51', 'ec428dc7-a821-4b21-b16b-c9f98f88687c');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('bb8c1b6c-45b8-4382-88f6-0b67f3663925', '17ec4924-cf46-44c8-b814-69f1c0ab6548', '2fe5ff3e-f808-4e6d-916a-d4959bb87227');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('c7bb77e9-26d1-4e64-9a09-51f2a1ca0699', '152054a7-2d6f-4975-8d2f-9fb7c009070d', 'ad8325f8-1f19-4364-8a1f-0d85732d7d71');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('d2b84b2b-0a74-49bf-a4ef-613d3f49a6f0', '939b6e45-82ea-4c94-8bbb-dd87eba0adda', 'ad8325f8-1f19-4364-8a1f-0d85732d7d71');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('d82080e3-ed25-429e-a14d-3d2902573cf6', '17ec4924-cf46-44c8-b814-69f1c0ab6548', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('defb694b-bc20-46e2-aba3-c9ec76a02706', '6a8376c6-319a-46dc-90fb-3410e4381b9e', 'b84f59d3-650e-4cb6-815d-cec6bfc49ac0');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('e0ffaa46-8a38-4db1-a080-40d80b093ec2', '6d518b5c-ca45-4fd8-9ce2-be076a35b264', '7d9ca4bb-b259-4ce2-b069-4893f074b597');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('f2682a66-cf46-4480-b88e-b48627391525', '718abba8-fd1d-490c-9ecc-81addc302a35', 'fa97335b-3efd-499d-9ec2-78c49597a301');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('f996ec6a-18e8-409b-81f4-9e8809490bfc', '8cec5a20-206d-4b57-a021-24aa340f1f51', '7e92e09b-7a2a-44ba-b2c9-21a0bc9b7d63');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('fc6ba4aa-b2fd-4258-9ea1-94ccf2e8b6d4', 'ec2400a2-78ee-4ec8-8399-cbcc1c23cb5b', '7307299d-ec02-4f52-98d0-baf027033698');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('fd580642-161c-4559-9fad-faceda684eaf', '805ab00f-c607-42bc-9d20-60dfd58763db', 'ec428dc7-a821-4b21-b16b-c9f98f88687c');
