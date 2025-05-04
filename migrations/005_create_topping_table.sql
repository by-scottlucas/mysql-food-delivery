CREATE TABLE tb_topping (
    id_topping INT NOT NULL AUTO_INCREMENT,
    nm_topping VARCHAR(100),
    ds_type VARCHAR(50),
    vl_price DECIMAL(10,2) CHECK (vl_price >= 0),
    ds_image_url TEXT,
    fl_active BOOLEAN DEFAULT true,
    dt_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_topping PRIMARY KEY(id_topping)
) ENGINE InnoDB;
