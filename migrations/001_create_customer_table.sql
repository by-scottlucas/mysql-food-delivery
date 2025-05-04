CREATE TABLE tb_customer (
    id_customer INT NOT NULL AUTO_INCREMENT,
    nm_customer VARCHAR(100),
    ds_email VARCHAR(100) UNIQUE,
    nr_phone VARCHAR(20),
    tx_password VARCHAR(120),
    dt_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_customer PRIMARY KEY(id_customer)
) ENGINE InnoDB;