CREATE TABLE tb_product (
    id_product INT NOT NULL AUTO_INCREMENT,
    nm_product VARCHAR(100),
    ds_description TEXT,
    vl_price DECIMAL(10,2) CHECK (vl_price >= 0),
    ds_image_url TEXT,
    id_category INT NOT NULL,
    fl_active BOOLEAN DEFAULT true,
    dt_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_product PRIMARY KEY(id_product),
    CONSTRAINT fk_category_product FOREIGN KEY(id_category)
        REFERENCES tb_category(id_category)
) ENGINE InnoDB;
