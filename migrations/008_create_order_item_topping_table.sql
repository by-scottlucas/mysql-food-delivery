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