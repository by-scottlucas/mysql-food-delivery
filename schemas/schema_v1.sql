/*
Banco de Dados: Sistema de Delivery
Data: 03/05/2025 | Hora 16:00
Desenvolvido para estudos da linguagem SQL
Por: Lucas Santos Silva - Técnico em Informática (Suporte), Técnico em Informática para Internet e Desenvolvedor Full Stack
*/

CREATE DATABASE db_food_delivery CHARACTER SET='utf8' COLLATE='utf8_general_ci';

USE db_food_delivery;

CREATE TABLE tb_customer (
    id_customer INT NOT NULL AUTO_INCREMENT,
    nm_customer VARCHAR(100),
    ds_email VARCHAR(100) UNIQUE,
    nr_phone VARCHAR(20),
    tx_password VARCHAR(120),
    dt_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_customer
        PRIMARY KEY(id_customer))
    ENGINE InnoDB;


CREATE TABLE tb_address (
    id_address INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    nm_street VARCHAR(100),
    nr_address VARCHAR(10),
    nm_district VARCHAR(50),
    nm_city VARCHAR(50),
    sg_state CHAR(2),
    cd_postal_code VARCHAR(10),
    ds_complement VARCHAR(100) NULL,
    fl_default BOOLEAN DEFAULT false,
    CONSTRAINT pk_address
        PRIMARY KEY(id_address),
    CONSTRAINT fk_customer_address
        FOREIGN KEY(id_customer)
            REFERENCES tb_customer(id_customer)
            ON DELETE CASCADE)
    ENGINE InnoDB;

CREATE TABLE tb_category (
    id_category INT NOT NULL AUTO_INCREMENT,
    nm_category VARCHAR(50),
    CONSTRAINT pk_category
        PRIMARY KEY(id_category))
    ENGINE InnoDB;

CREATE TABLE tb_product (
    id_product INT NOT NULL AUTO_INCREMENT,
    nm_product VARCHAR(100),
    ds_description TEXT,
    vl_price DECIMAL(10,2) CHECK (vl_price >= 0),
    ds_image_url TEXT,
    id_category INT NOT NULL,
    fl_active BOOLEAN DEFAULT true,
    dt_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_product
        PRIMARY KEY(id_product),
    CONSTRAINT fk_category_product
        FOREIGN KEY(id_category)
            REFERENCES tb_category(id_category))
    ENGINE InnoDB;

CREATE TABLE tb_topping (
    id_topping INT NOT NULL AUTO_INCREMENT,
    nm_topping VARCHAR(100),
    ds_type VARCHAR(50),
    vl_price DECIMAL(10,2) CHECK (vl_price >= 0),
    ds_image_url TEXT,
    fl_active BOOLEAN DEFAULT true,
    dt_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_topping
        PRIMARY KEY(id_topping))
    ENGINE InnoDB;

CREATE TABLE tb_order (
    id_order INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    id_address INT NOT NULL,
    ds_status ENUM('pendente', 'preparando', 'enviado', 'entregue', 'cancelado') NOT NULL,
    vl_total DECIMAL(10,2) CHECK (vl_total >= 0),
    dt_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_order
        PRIMARY KEY(id_order),
    CONSTRAINT fk_customer_order
        FOREIGN KEY(id_customer)
            REFERENCES tb_customer(id_customer),
    CONSTRAINT fk_address_order
        FOREIGN KEY(id_address)
            REFERENCES tb_address(id_address))
    ENGINE InnoDB;

CREATE TABLE tb_order_item (
    id_order_item INT NOT NULL AUTO_INCREMENT,
    id_order INT NOT NULL,
    id_product INT NOT NULL,
    nr_quantity INT NOT NULL CHECK (nr_quantity > 0),
    ds_notes TEXT,
    vl_subtotal DECIMAL(10,2) CHECK (vl_subtotal >= 0),
    CONSTRAINT pk_order_item
        PRIMARY KEY(id_order_item),
    CONSTRAINT fk_order_order_item
        FOREIGN KEY(id_order)
            REFERENCES tb_order(id_order),
    CONSTRAINT fk_product_order_item
        FOREIGN KEY(id_product)
            REFERENCES tb_product(id_product))
    ENGINE InnoDB;

CREATE TABLE tb_order_item_topping (
    id_order_item INT NOT NULL,
    id_topping INT NOT NULL,
    CONSTRAINT pk_order_item_topping
        PRIMARY KEY(id_order_item, id_topping),
    CONSTRAINT fk_order_item_order_item_topping
        FOREIGN KEY(id_order_item)
            REFERENCES tb_order_item(id_order_item),
    CONSTRAINT fk_topping_order_item_topping
        FOREIGN KEY(id_topping)
            REFERENCES tb_topping(id_topping))
    ENGINE InnoDB;

CREATE TABLE tb_payment (
    id_payment INT NOT NULL AUTO_INCREMENT,
    id_order INT NOT NULL,
    ds_method VARCHAR(30),
    ds_status VARCHAR(30),
    vl_amount DECIMAL(10,2) CHECK (vl_amount >= 0),
    dt_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_payment
        PRIMARY KEY(id_payment),
    CONSTRAINT fk_order_payment
        FOREIGN KEY(id_order)
            REFERENCES tb_order(id_order))
    ENGINE InnoDB;
