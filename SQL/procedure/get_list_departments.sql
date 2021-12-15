
-- # -------------------------------- #
-- departments 조회 프로시져
-- # -------------------------------- #

DROP PROCEDURE IF EXISTS get_list_departments;
DELIMITER $$
CREATE PROCEDURE get_list_departments(
    IN `idx` INT,
    IN `show_row_count` INT
)
BEGIN

     SELECT * 
       FROM departments
      WHERE `idx` <= department_id
	  LIMIT `show_row_count`;


END $$
DELIMITER ;

CALL get_list_departments(1, 10);