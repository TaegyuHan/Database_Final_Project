
-- # -------------------------------- #
-- products 조회 프로시져
-- # -------------------------------- #

DROP PROCEDURE IF EXISTS get_list_products;
DELIMITER $$
CREATE PROCEDURE get_list_products(
    IN `idx` INT,
    IN `show_row_count` INT
)
BEGIN

	SELECT A.product_id, A.product_name, B.aisle, C.department
	  FROM ( SELECT * 
	           FROM products
	          WHERE `idx` <= product_id
	          LIMIT `show_row_count` ) AS A
	        	 
	   INNER JOIN aisles AS B
	   ON A.aisle_id = B.aisle_id
	
	      INNER JOIN departments AS C
	   ON A.department_id = c.department_id;

END $$
DELIMITER ;

CALL get_list_products(1, 10);