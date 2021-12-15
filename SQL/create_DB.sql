-- # ---------------------------------------------------# 
-- 데이터 베이스 생성 코드
-- # ---------------------------------------------------# 

DROP DATABASE IF EXISTS `finalDB`;
CREATE DATABASE IF NOT EXISTS `finalDB`;
USE `finalDB`;




-- # ---------------------------------------------------# 
-- 테이블 생성 코드 
-- # ---------------------------------------------------# 

-- csv 데이터 load 활성화
SET GLOBAL local_infile=true;

-- # ---------------------------------------------------# 
-- # MySQL
-- # table name : departments
-- # --------------------
-- # department_id : INT
-- # department : VARCHAR(15 + 3 = 18)

DROP TABLE IF EXISTS `finalDB`.`departments`;
CREATE TABLE `finalDB`.`departments` (
    `department_id` INT PRIMARY KEY AUTO_INCREMENT,
    `department` VARCHAR(18)
);

-- csv 데이터 넣기
LOAD DATA LOCAL INFILE 'C:/Users/gksxo/Desktop/Folder/github/Database_Final_Project/data/csv/departments.csv' 
INTO TABLE `finalDB`.`departments`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS (
    department_id,
    department
);

ALTER TABLE `finalDB`.`departments` AUTO_INCREMENT=22;
-- SELECT * FROM `finalDB`.`departments`;




-- # ---------------------------------------------------# 
-- # MySQL
-- # table name : aisles
-- # --------------------
-- # aisle_id : INT
-- # aisle : VARCHAR(29 + 3 = 32)

DROP TABLE IF EXISTS `finalDB`.`aisles`;
CREATE TABLE `finalDB`.`aisles` (
    `aisle_id` INT PRIMARY KEY AUTO_INCREMENT,
    `aisle` VARCHAR(32)
);

-- csv 데이터 넣기
LOAD DATA LOCAL INFILE 'C:/Users/gksxo/Desktop/Folder/github/Database_Final_Project/data/csv/aisles.csv' 
INTO TABLE `finalDB`.`aisles`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS (
    aisle_id,
    aisle
);

ALTER TABLE `finalDB`.`aisles` AUTO_INCREMENT=135;
-- SELECT * FROM `finalDB`.`aisles`;




-- # ---------------------------------------------------# 
-- # MySQL
-- # table name : orders
-- # --------------------
-- # order_id : INT
-- # user_id : INT
-- # eval_set : VARCHAR(8)
-- # order_number : INT
-- # order_dow : INT
-- # order_hour_of_day : INT
-- # days_since_prior_order : INT


DROP TABLE IF EXISTS `finalDB`.`orders`;
CREATE TABLE `finalDB`.`orders` (
    `order_id` INT PRIMARY KEY AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `eval_set` VARCHAR(8),
    `order_number` INT,
    `order_dow` INT,
    `order_hour_of_day` INT,
    `days_since_prior_order` INT
);

LOAD DATA LOCAL INFILE 'C:/Users/gksxo/Desktop/Folder/github/Database_Final_Project/data/csv/orders.csv' 
INTO TABLE `finalDB`.`orders`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS (
    order_id,
    user_id,
    eval_set,
    order_number,
    order_dow,
    order_hour_of_day,
    days_since_prior_order
);

ALTER TABLE `finalDB`.`orders` AUTO_INCREMENT=3421084;
-- SELECT * FROM `finalDB`.`orders` LIMIT 10;




-- -- # ---------------------------------------------------# 
-- # MySQL
-- # table name : products
-- # --------------------
-- # product_id : INT
-- # product_name : TEXT 
-- # aisle_id : INT
-- # department_id : INT

CREATE TABLE `products` (
	`product_id` INT(11) NOT NULL AUTO_INCREMENT,
	`product_name` TEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`aisle_id` INT(11) NULL DEFAULT NULL,
	`department_id` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`product_id`) USING BTREE,
	INDEX `FK_aisle_id` (`aisle_id`) USING BTREE,
	INDEX `FK_department_id` (`department_id`) USING BTREE,
	CONSTRAINT `FK_aisle_id` FOREIGN KEY (`aisle_id`) REFERENCES `finaldb`.`aisles` (`aisle_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT `FK_department_id` FOREIGN KEY (`department_id`) REFERENCES `finaldb`.`departments` (`department_id`) ON UPDATE CASCADE ON DELETE NO ACTION
);

LOAD DATA LOCAL INFILE 'C:/Users/gksxo/Desktop/Folder/github/Database_Final_Project/data/csv/products.csv' 
INTO TABLE `finalDB`.`products`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS (
    product_id, 
    product_name, 
    aisle_id, 
    department_id
);

ALTER TABLE `finalDB`.`products` AUTO_INCREMENT=49689;
-- SELECT * FROM `finalDB`.`products` LIMIT 10;




-- # ---------------------------------------------------# 
-- # MySQL
-- # table name : order_products
-- # --------------------
-- # order_id : INT
-- # product_id : INT
-- # add_to_cart_order : INT
-- # reordered : INT


DROP TABLE IF EXISTS `finalDB`.`order_products`;
CREATE TABLE `order_products` (
	`order_id` INT(11) NULL DEFAULT NULL,
	`product_id` INT(11) NULL DEFAULT NULL,
	`add_to_cart_order` INT(11) NULL DEFAULT NULL,
	`reordered` INT(11) NULL DEFAULT NULL,
	INDEX `FK_order_id` (`order_id`) USING BTREE,
	INDEX `FK_product_id` (`product_id`) USING BTREE,
	CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `finaldb`.`orders` (`order_id`) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `finaldb`.`products` (`product_id`) ON UPDATE CASCADE ON DELETE RESTRICT
);


LOAD DATA LOCAL INFILE 'C:/Users/gksxo/Desktop/Folder/github/Database_Final_Project/data/csv/order_products__prior.csv' 
INTO TABLE `finalDB`.`order_products`
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS (
    order_id,
    product_id,
    add_to_cart_order,
    reordered
);

-- 삽입 데이터 확인 열 생성
ALTER TABLE order_products ADD order_product_id INT DEFAULT NULL;

-- 버퍼 수정 필요
-- my.ini file 에서
-- innodb_buffer_pool_size 수정 > innodb_buffer_pool_size=2G

-- index 번호 생성
SET @rownum = 0;

UPDATE order_products
SET order_products_id = (@rownum := 1 + @rownum);
SELECT * FROM order_products LIMIT 10;

-- UNIQUE 값으로 생성
ALTER TABLE `order_products`
	ADD UNIQUE INDEX `order_product_id` (`order_product_id`);

-- 새로생성되는 값
ALTER TABLE `finalDB`.`order_products` AUTO_INCREMENT=31481718;

-- SELECT * FROM `finalDB`.`order_products`1 LIMIT 10;