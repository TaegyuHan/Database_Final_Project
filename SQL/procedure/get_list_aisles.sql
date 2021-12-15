
-- # -------------------------------- #
-- aisles 조회 프로시져
-- # -------------------------------- #

DROP PROCEDURE IF EXISTS get_list_aisles;
DELIMITER $$
CREATE PROCEDURE get_list_aisles(
    IN `idx` INT,
    IN `show_row_count` INT
)
BEGIN

      SELECT * 
        FROM aisles
       WHERE `idx` <= aisle_id
	   LIMIT `show_row_count`;

END $$
DELIMITER ;

CALL get_list_aisles(1, 10);