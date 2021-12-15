
-- # -------------------------------- #
-- order products 업데이트 전
-- 조회 프로시져
-- # -------------------------------- #

DROP PROCEDURE IF EXISTS get_update_list_order_products;
DELIMITER $$
CREATE PROCEDURE get_update_list_order_products(
    IN `in_order_id` INT,
    IN `idx` INT,
    IN `show_row_count` INT
)
BEGIN

	SELECT * 
	FROM order_products
	WHERE order_id = `in_order_id`
	LIMIT `idx`, `show_row_count`;

END $$
DELIMITER ;

CALL get_update_list_order_products(2, 1, 10);