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

INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('0a5e397a-a255-4550-890f-7bb4bf16f6f0', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('0b4b842f-2322-477b-a149-956c542fa214', '0515f17a-1408-4e52-bdfc-fac22ae0652c', '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('16c32120-6cad-410a-a7cd-db6fd0773d41', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '410b5731-4c04-4262-a734-b5c03c140569');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('1c9ab7f0-5387-4789-99cb-03677e55f6d4', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '02cea732-e77c-4546-b841-0fd048f15d0c');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('24398e2b-fbb9-459e-bdcf-e3adf754c9ce', '139fcae1-5f39-4f06-8456-af152672b082', '208dbcc3-caeb-401a-aec2-03c97db83495');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('245930a4-16d9-4eec-8e3a-123a0b0a9419', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'cb099636-c1c2-44d5-8c25-8d18cf619e23');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('33220fc5-aba1-4fa6-9740-6ededed10b91', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'c05c67f9-8333-4c0b-b170-4929a2661085');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('4ca260f4-97d2-4606-ace7-16f118d7d47c', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('51e86b77-e3e9-472a-9bdb-129d7cee95a0', '139fcae1-5f39-4f06-8456-af152672b082', 'b1cb4347-9792-4454-b9f6-a8b5db3e9ee9');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('566bd497-3cfc-495c-a9a4-fafaaff999e7', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '006fe36f-1f53-49c6-b5d6-5dcca6571d42');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('5f3b6bc5-de5b-4a05-8de4-72c95e7c14fa', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '36d2421b-cbae-4dd3-aac7-4544efc9d6af');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('6271bd58-4b04-4d9c-967c-b37671d1700e', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('657ddd05-dc4d-4d93-b951-c329a7f2f488', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '72668ec0-19d6-4062-9477-45623f4f3f9a');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('7068b4cc-5154-45f8-a7bc-6036ed3578a0', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '7bd5774f-6174-48a9-b456-ed132353885a');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('7aa4dc27-479d-43d0-85f8-f413d03c457d', '139fcae1-5f39-4f06-8456-af152672b082', '0050a1a6-1ee2-4ad7-9685-8b8e6292e277');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('835c0be1-0a21-4f81-80ed-09db62857b89', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '0050a1a6-1ee2-4ad7-9685-8b8e6292e277');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('84d15da9-cda4-4692-8355-0df7cf1fd839', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'fdf00dc4-cb2b-42a0-9b63-46132723946b');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9a9d7e52-f4d1-47fb-9dad-1dbaa1694ce8', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '95925ddf-95ff-4e5e-82a8-8d98cb5c7790');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9c1f7758-8f17-4f58-8732-c6ebdd15143b', '139fcae1-5f39-4f06-8456-af152672b082', 'c05c67f9-8333-4c0b-b170-4929a2661085');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9e03056b-4554-43a8-9e29-31f642e1cd96', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '447bac09-6ed6-48cb-9d43-321833b91eee');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9f3b1191-3510-46a1-8ffe-84ec21b557d3', '46e94a93-5511-43bc-b88d-b15525af7cbc', '36d2421b-cbae-4dd3-aac7-4544efc9d6af');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b1335071-8e5b-4010-8e82-7ae00525cb74', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '24a102fe-58cf-4de1-9063-1db1c75d9eb4');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b23b2ab6-e042-4644-9684-6be4b739af7f', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b4614d60-d10b-4cc5-9bab-9ae691095c93', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'b1cb4347-9792-4454-b9f6-a8b5db3e9ee9');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b61ec0f9-b746-4239-8964-5a40e5d32148', '46e94a93-5511-43bc-b88d-b15525af7cbc', 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('bd197426-1b2e-4337-bebb-6784a831d297', '139fcae1-5f39-4f06-8456-af152672b082', '72668ec0-19d6-4062-9477-45623f4f3f9a');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('d1cfc0d9-9323-4dec-8aa6-f36f02e410ae', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '208dbcc3-caeb-401a-aec2-03c97db83495');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('ddb5dd17-51a0-4bf1-9a9a-21801cdb7158', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'b30ac8ef-ad14-477e-9f57-0fa0eba5d71d');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('eaeaed4c-5bd7-4b40-aca4-2caf60aad5fd', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'decda335-f5d2-4987-96bf-79794f1462ab');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('f1ca0580-f41f-4a88-b5fd-e0aac6f7aa9c', '139fcae1-5f39-4f06-8456-af152672b082', '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('fa91d60d-d030-426a-a56b-eed74e2a94d4', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'a35424cc-fd28-44ac-a604-4c4b2d628f43');
