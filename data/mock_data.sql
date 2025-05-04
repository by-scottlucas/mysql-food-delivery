USE db_food_delivery;

INSERT INTO tb_category (nm_category) 
VALUES ('Açaí Tradicional'), ('Açaí com Fruta');

INSERT INTO tb_product (nm_product, ds_description, vl_price, ds_image_url, id_category, fl_active) 
VALUES
('Açaí 300ml', 'Açaí tradicional de 300ml', 12.00, 'img/300ml.jpg', 1, true),
('Açaí 500ml', 'Açaí tradicional de 500ml', 18.00, 'img/500ml.jpg', 1, true);

INSERT INTO tb_topping (nm_topping, ds_type, vl_price, ds_image_url, fl_active) 
VALUES
('Banana', 'fruta', 0.00, 'img/banana.jpg', true),
('Leite condensado', 'calda', 1.00, 'img/leite.jpg', true),
('Granola', 'adicional', 1.50, 'img/granola.jpg', true);

INSERT INTO tb_customer (nm_customer, ds_email, nr_phone, tx_password, dt_created) 
VALUES 
('Lucas Silva', 'lucas@email.com', '13999999999', 'HASH123', NOW());

INSERT INTO tb_address (id_customer, nm_street, nr_address, nm_district, nm_city, sg_state, cd_postal_code, ds_complement, fl_default) 
VALUES 
(1, 'Rua das Açaizeiras', '100', 'Centro', 'Santos', 'SP', '11000000', '', true);

INSERT INTO tb_order (id_customer, id_address, ds_status, vl_total, dt_created) 
VALUES 
(1, 1, 'pendente', 19.00, NOW());

INSERT INTO tb_order_item (id_order, id_product, nr_quantity, ds_notes, vl_subtotal) 
VALUES 
(1, 1, 1, 'Sem açúcar', 12.00);

INSERT INTO tb_order_item_topping (id_order_item, id_topping) 
VALUES 
(1, 1), (1, 2);

INSERT INTO tb_payment (id_order, ds_method, ds_status, vl_amount, dt_created) 
VALUES 
(1, 'cartao_credito', 'pendente', 19.00, NOW());
