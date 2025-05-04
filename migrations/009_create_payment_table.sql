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