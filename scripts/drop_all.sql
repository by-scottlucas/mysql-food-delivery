-- Remove all tables manually (if it is not necessary to drop the database).

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS tb_payment;
DROP TABLE IF EXISTS tb_order_item_topping;
DROP TABLE IF EXISTS tb_order_item;
DROP TABLE IF EXISTS tb_order;
DROP TABLE IF EXISTS tb_topping;
DROP TABLE IF EXISTS tb_product;
DROP TABLE IF EXISTS tb_category;
DROP TABLE IF EXISTS tb_address;
DROP TABLE IF EXISTS tb_customer;

SET FOREIGN_KEY_CHECKS = 1;