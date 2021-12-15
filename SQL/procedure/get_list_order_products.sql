
-- # -------------------------------- #
-- order_products 조회 프로시져
-- # -------------------------------- #

DROP PROCEDURE IF EXISTS get_list_order_products;
DELIMITER $$
CREATE PROCEDURE get_list_order_products(
    IN `idx` INT,
    IN `show_row_count` INT
)
BEGIN

	SELECT * 
	 FROM order_products 
 ORDER BY order_product_id DESC 
	LIMIT `idx`, `show_row_count`;
     
END $$
DELIMITER ;

CALL get_list_order_products(1, 10);