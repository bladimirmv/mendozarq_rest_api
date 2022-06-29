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
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('18dc2e23-9b46-44b7-adbd-2e3501cf27cc', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'a23de6cb-54a0-475e-acfd-975c36de336e');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('1c9ab7f0-5387-4789-99cb-03677e55f6d4', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '02cea732-e77c-4546-b841-0fd048f15d0c');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('24398e2b-fbb9-459e-bdcf-e3adf754c9ce', '139fcae1-5f39-4f06-8456-af152672b082', '208dbcc3-caeb-401a-aec2-03c97db83495');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('245930a4-16d9-4eec-8e3a-123a0b0a9419', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'cb099636-c1c2-44d5-8c25-8d18cf619e23');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('28226f70-b98c-4a3b-9276-bde4363ebe29', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'dea18ab5-3cd2-4626-bcff-ef4126af7303');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('33220fc5-aba1-4fa6-9740-6ededed10b91', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'c05c67f9-8333-4c0b-b170-4929a2661085');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('3d331709-cda8-40d4-bdaa-c9ade49dd527', '33ea4589-56fb-4d08-a5a1-55d676daebbb', '6dd0e270-fb5c-4e27-ab6f-c8e79c258047');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('3e3b274b-491b-4070-b7aa-f45153c23ddf', '95ab02e8-a716-465f-8c91-947bf8f33906', 'c6103880-4cce-4ffd-bb19-120e00986d14');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('3f736604-d9d5-4417-a124-e63f4377bd89', '0a0dfb3c-b600-4473-be3a-b79ded043822', '0ffbfaa6-a0f3-4374-afda-a7dee8bd8618');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('45815f56-259b-40f5-8273-b1b339dcfc2c', '95ab02e8-a716-465f-8c91-947bf8f33906', '46445a16-b0e9-4200-a080-3cf1cd20cca0');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('4ca260f4-97d2-4606-ace7-16f118d7d47c', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('51e86b77-e3e9-472a-9bdb-129d7cee95a0', '139fcae1-5f39-4f06-8456-af152672b082', 'b1cb4347-9792-4454-b9f6-a8b5db3e9ee9');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('566bd497-3cfc-495c-a9a4-fafaaff999e7', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '006fe36f-1f53-49c6-b5d6-5dcca6571d42');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('5847cf35-02e9-47ba-978b-e58fd9f086dc', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '9104aded-4387-44dd-a95d-850445433181');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('5bb11414-b71e-4404-8d61-29b6ecc6a8ad', '9b8bbf40-3894-4cbb-9fdd-6d9e3107018c', 'a23de6cb-54a0-475e-acfd-975c36de336e');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('5f3b6bc5-de5b-4a05-8de4-72c95e7c14fa', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '36d2421b-cbae-4dd3-aac7-4544efc9d6af');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('5fb7b7a1-4326-492b-a054-b59eb22eebcd', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '56eb1196-c03c-4c5a-84bd-64284c32d9eb');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('6271bd58-4b04-4d9c-967c-b37671d1700e', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '4d6712b0-c7f5-48f2-bfa5-305e8a766781');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('657ddd05-dc4d-4d93-b951-c329a7f2f488', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '72668ec0-19d6-4062-9477-45623f4f3f9a');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('66e3ec50-2494-4a9d-88b4-54e7ab49f82a', 'db512728-2154-4df3-91e9-4a802b21632c', 'd2bd9d15-1039-4444-8dcf-082592157bdd');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('7068b4cc-5154-45f8-a7bc-6036ed3578a0', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '7bd5774f-6174-48a9-b456-ed132353885a');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('70739894-980d-4721-ad81-39314757d654', '33ea4589-56fb-4d08-a5a1-55d676daebbb', '4b9e4a99-2619-4805-ac41-0428dc4bce45');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('738b23ab-a061-4596-b84e-3e92ebbb5ebe', '9097c619-6e0c-46cb-9ecb-72ecc1b6eb3b', '8910a1bb-e604-4fb7-b745-837c7a22b4b0');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('769d77ad-eee9-4662-8947-112ef1a47c4b', '9b8bbf40-3894-4cbb-9fdd-6d9e3107018c', '4cc90ad9-5e15-436d-8106-bf3cddd1ab41');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('7aa4dc27-479d-43d0-85f8-f413d03c457d', '139fcae1-5f39-4f06-8456-af152672b082', '0050a1a6-1ee2-4ad7-9685-8b8e6292e277');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('7abc21c6-b813-49a2-94ab-a78ff7845f8b', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '02718e83-f899-4242-97c2-ae550e750683');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('7c385e4d-5f7b-491d-9d77-1b3f0b52702b', '79f1a74b-f19c-4b63-9cfd-4ed0098a2a78', 'b877f8ba-4a1b-426a-8901-762a5ec02746');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('835c0be1-0a21-4f81-80ed-09db62857b89', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '0050a1a6-1ee2-4ad7-9685-8b8e6292e277');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('845115f6-816d-41f6-a47e-442e702008dd', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'd2bd9d15-1039-4444-8dcf-082592157bdd');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('84d15da9-cda4-4692-8355-0df7cf1fd839', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'fdf00dc4-cb2b-42a0-9b63-46132723946b');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('878e7345-7780-478d-8b00-995a7d87261b', '9097c619-6e0c-46cb-9ecb-72ecc1b6eb3b', '56eb1196-c03c-4c5a-84bd-64284c32d9eb');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('87b268da-1efc-49f0-adda-b17af6e64129', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('890679a6-e98e-4a2e-8e7d-bd0a198ecf75', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'e81f4e59-44cc-49fc-9d14-1a10b778fc4f');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9455b5c1-0a1c-491a-98b6-44272a8c3d32', '9097c619-6e0c-46cb-9ecb-72ecc1b6eb3b', '2d078933-ff74-43ae-8322-fc19ba53b39c');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9a9d7e52-f4d1-47fb-9dad-1dbaa1694ce8', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '95925ddf-95ff-4e5e-82a8-8d98cb5c7790');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9c1f7758-8f17-4f58-8732-c6ebdd15143b', '139fcae1-5f39-4f06-8456-af152672b082', 'c05c67f9-8333-4c0b-b170-4929a2661085');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9e03056b-4554-43a8-9e29-31f642e1cd96', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '447bac09-6ed6-48cb-9d43-321833b91eee');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9f3b1191-3510-46a1-8ffe-84ec21b557d3', '46e94a93-5511-43bc-b88d-b15525af7cbc', '36d2421b-cbae-4dd3-aac7-4544efc9d6af');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('9f742434-987e-4c65-be23-bde14e231eb3', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '4cc90ad9-5e15-436d-8106-bf3cddd1ab41');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('a1dba1e1-3bcc-4a72-aac8-25b87354c18c', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('a3f57cec-e9b1-4625-b184-eec4c3bdcd73', '79f1a74b-f19c-4b63-9cfd-4ed0098a2a78', '51ca6e63-a7ef-4b11-ac4a-d885f5479340');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('a6d48a78-d031-479f-abe7-eca96dc82fbb', '46e94a93-5511-43bc-b88d-b15525af7cbc', 'd54e1a74-b861-4ad6-a934-c1f5661997b3');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('a8633dbe-cabe-47a7-afb0-fd2f66e15b33', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'e19d5792-f417-411e-abce-436ef5fb7815');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b1335071-8e5b-4010-8e82-7ae00525cb74', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', '24a102fe-58cf-4de1-9063-1db1c75d9eb4');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b23b2ab6-e042-4644-9684-6be4b739af7f', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'ce1c1bf2-d9a1-449d-a02b-9b3f220f1dbb');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b4614d60-d10b-4cc5-9bab-9ae691095c93', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'b1cb4347-9792-4454-b9f6-a8b5db3e9ee9');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b61ec0f9-b746-4239-8964-5a40e5d32148', '46e94a93-5511-43bc-b88d-b15525af7cbc', 'd6741f11-aa21-486a-817f-1d516c452da1');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('b755f24e-c9a7-4220-b6c1-ba03d6a6478b', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '4b9e4a99-2619-4805-ac41-0428dc4bce45');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('bd197426-1b2e-4337-bebb-6784a831d297', '139fcae1-5f39-4f06-8456-af152672b082', '72668ec0-19d6-4062-9477-45623f4f3f9a');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('c3080b16-b052-4be1-b846-52279117a88e', '0a0dfb3c-b600-4473-be3a-b79ded043822', 'dea18ab5-3cd2-4626-bcff-ef4126af7303');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('c4f7aa33-a532-41c8-b368-87a830181d65', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '2d078933-ff74-43ae-8322-fc19ba53b39c');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('c5c8f06f-44c3-45ab-babe-a7eb65a2ac1d', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '6dd0e270-fb5c-4e27-ab6f-c8e79c258047');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('c8deca10-bcb5-450b-9438-a2d9491ddcb3', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', 'b877f8ba-4a1b-426a-8901-762a5ec02746');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('ca638d97-cd97-46c1-9b9b-b49c9cbe9f29', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '0ffbfaa6-a0f3-4374-afda-a7dee8bd8618');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('d1cfc0d9-9323-4dec-8aa6-f36f02e410ae', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '208dbcc3-caeb-401a-aec2-03c97db83495');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('d44ec167-6cbe-46b1-9e27-96d6667f8b0e', '79f1a74b-f19c-4b63-9cfd-4ed0098a2a78', 'e19d5792-f417-411e-abce-436ef5fb7815');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('dbce4d2d-b1a7-4b46-b912-3d2e1496d599', '95ab02e8-a716-465f-8c91-947bf8f33906', '69ad9459-0273-46a9-a312-e5b7d8952e86');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('ddb5dd17-51a0-4bf1-9a9a-21801cdb7158', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'b30ac8ef-ad14-477e-9f57-0fa0eba5d71d');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('e7518d65-f8d2-46c3-86e0-ab7f36d9d036', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'c6bdc4d0-d3ae-4365-86fd-09777b602cdc');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('eaeaed4c-5bd7-4b40-aca4-2caf60aad5fd', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'decda335-f5d2-4987-96bf-79794f1462ab');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('ebfa8a30-126b-4972-bcb4-a77ad7380731', '4284c9b8-ba48-4431-ab43-9684b0951f5d', '6ff0adec-3491-4d93-b038-d25effe2dfc1');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('ec10953f-9ca1-427a-b0ab-40ac3004c129', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '2a04a96f-5b41-4140-ab9a-94ed38a75d6e');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('f0bb39fd-a4be-4fa7-8d30-8ad272465cb1', 'f724fb00-fde9-46fb-a528-f5eda0dcd23b', '8910a1bb-e604-4fb7-b745-837c7a22b4b0');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('f1ca0580-f41f-4a88-b5fd-e0aac6f7aa9c', '139fcae1-5f39-4f06-8456-af152672b082', '03819ff5-84a4-4bf2-bb23-fea2ca888a6f');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('f2cf8c89-a836-4741-b58b-257081e804b4', '7e15ebbf-79ea-43f4-ae37-de74a84a6735', '9104aded-4387-44dd-a95d-850445433181');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('f5b39e53-506e-4cd3-93fa-4d22024b9139', '9b8bbf40-3894-4cbb-9fdd-6d9e3107018c', '353f7727-3130-46a3-be67-92ab0896a630');
INSERT INTO mendozarq.detallecategoriaproducto (uuid, uuidCategoria, uuidProducto) VALUES ('fa91d60d-d030-426a-a56b-eed74e2a94d4', '9d2551ac-b73e-40b2-b88e-3820c4f3ca29', 'a35424cc-fd28-44ac-a604-4c4b2d628f43');
