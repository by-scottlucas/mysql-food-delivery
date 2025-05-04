CREATE TABLE tb_order (
    id_order INT NOT NULL AUTO_INCREMENT,
    id_customer INT NOT NULL,
    id_address INT NOT NULL,
    ds_status ENUM('pendente', 'preparando', 'enviado', 'entregue', 'cancelado') NOT NULL,
    vl_total DECIMAL(10,2) CHECK (vl_total >= 0),
    dt_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_order PRIMARY KEY(id_order),
    CONSTRAINT fk_customer_order FOREIGN KEY(id_customer)
        REFERENCES tb_customer(id_customer),
    CONSTRAINT fk_address_order FOREIGN KEY(id_address)
        REFERENCES tb_address(id_address)
) ENGINE InnoDB;
