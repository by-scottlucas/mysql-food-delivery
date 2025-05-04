-- 1. Select all customers
SELECT * FROM tb_customer;

-- 2. Select a specific customer by ID
SELECT * FROM tb_customer WHERE id_customer = 1;

-- 3. Select addresses of a specific customer
SELECT * FROM tb_address WHERE id_customer = 1;

-- 4. Select all products from a specific category
SELECT * FROM tb_product WHERE id_category = 1;

-- 5. Select all items in a specific order
SELECT * FROM tb_order_item WHERE id_order = 1;

-- 6. Calculate the total value of an order (considering items)
SELECT SUM(vl_subtotal) AS total_order FROM tb_order_item WHERE id_order = 1;

-- 7. Select all available toppings
SELECT * FROM tb_topping;

-- 8. Select the toppings of a specific order item
SELECT * 
FROM tb_order_item_topping 
JOIN tb_topping ON tb_order_item_topping.id_topping = tb_topping.id_topping 
WHERE tb_order_item_topping.id_order_item = 1;

-- 9. Select order history of a specific customer
SELECT * FROM tb_order WHERE id_customer = 1;

-- 10. Select the payment of a specific order
SELECT * FROM tb_payment WHERE id_order = 1;

-- 11. Select all orders with status 'pending'
SELECT * FROM tb_order WHERE ds_status = 'pending';

-- 12. Update the status of an order
UPDATE tb_order SET ds_status = 'preparing' WHERE id_order = 1;

-- 13. Insert a new customer
INSERT INTO tb_customer (nm_customer, ds_email, nr_phone, tx_password)
VALUES ('João Silva', 'joao@example.com', '123456789', 'secure_password');

-- 14. Insert a new product
INSERT INTO tb_product (nm_product, ds_description, vl_price, id_category)
VALUES ('Açaí with Condensed Milk', 'Açaí with condensed milk and granola', 15.99, 1);

-- 15. Update the price of a product
UPDATE tb_product SET vl_price = 16.99 WHERE id_product = 1;

-- 16. Delete a customer
DELETE FROM tb_customer WHERE id_customer = 1;

-- 17. Select products and their respective toppings
SELECT p.nm_product, t.nm_topping
FROM tb_product p
JOIN tb_order_item oi ON p.id_product = oi.id_product
JOIN tb_order_item_topping oit ON oi.id_order_item = oit.id_order_item
JOIN tb_topping t ON oit.id_topping = t.id_topping
WHERE p.id_category = 1;

-- 18. Select the most expensive products
SELECT * FROM tb_product ORDER BY vl_price DESC LIMIT 5;
