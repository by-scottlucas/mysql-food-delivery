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