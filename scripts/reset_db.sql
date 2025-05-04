-- Drops and recreates the database from scratch.

DROP DATABASE IF EXISTS db_food_delivery;
CREATE DATABASE db_food_delivery CHARACTER SET='utf8' COLLATE='utf8_general_ci';
USE db_food_delivery;
SOURCE ../schema.sql;
SOURCE ../data/mock_data.sql;