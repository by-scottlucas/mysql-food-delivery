-- Clears all tables (keeps the structure, removes data).

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE tb_payment;
TRUNCATE TABLE tb_order_item_topping;
TRUNCATE TABLE tb_order_item;
TRUNCATE TABLE tb_order;
TRUNCATE TABLE tb_topping;
TRUNCATE TABLE tb_product;
TRUNCATE TABLE tb_category;
TRUNCATE TABLE tb_address;
TRUNCATE TABLE tb_customer;

SET FOREIGN_KEY_CHECKS = 1;