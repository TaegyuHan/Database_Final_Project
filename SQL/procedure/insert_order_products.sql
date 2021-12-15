
-- # -------------------------------- #
-- order_products 삽입 프로시져
-- # -------------------------------- #

DROP PROCEDURE IF EXISTS insert_order_products;
DELIMITER $$
CREATE PROCEDURE insert_order_products(
    IN `in_order_id` INT,
    IN `in_product_id` INT,
    IN `in_add_to_cart_order` INT,
    IN `in_reordered` INT
)
BEGIN

	INSERT INTO finaldb.order_products
    (order_id, product_id, add_to_cart_order, reordered) 
    VALUES 
    (`in_order_id`, `in_product_id`, `in_add_to_cart_order`, `in_reordered`);

END $$
DELIMITER ;

-- CALL insert_order_products(2, 28985, -1, -1);