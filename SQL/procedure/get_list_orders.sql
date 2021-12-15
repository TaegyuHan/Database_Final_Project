
-- # -------------------------------- #
-- orders 조회 프로시져
-- # -------------------------------- #

DROP PROCEDURE IF EXISTS get_list_orders;
DELIMITER $$
CREATE PROCEDURE get_list_orders(
    IN `idx` INT,
    IN `show_row_count` INT
)
BEGIN

      SELECT order_id, user_id, eval_set, order_number,
		     NUM_TO_STRING_DAY(order_dow) AS order_day,
      	     order_hour_of_day,
      	     days_since_prior_order
        FROM orders
       WHERE `idx` <= order_id
	   LIMIT `show_row_count`;

END $$
DELIMITER ;

CALL get_list_orders(1, 10);