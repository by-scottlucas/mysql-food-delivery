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
    CONSTRAINT pk_address PRIMARY KEY(id_address),
    CONSTRAINT fk_customer_address FOREIGN KEY(id_customer)
        REFERENCES tb_customer(id_customer)
        ON DELETE CASCADE
) ENGINE InnoDB;
