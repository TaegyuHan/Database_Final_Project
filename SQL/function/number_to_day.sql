-- # -------------------------------- #
-- 번호 요일로 변경 함수
-- # -------------------------------- #

-- 함수 생성 가능
SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS NUM_TO_STRING_DAY;

DELIMITER $$
CREATE FUNCTION NUM_TO_STRING_DAY ( 
    day_number INT 
)
RETURNS CHAR(3)

BEGIN

     DECLARE day_str CHAR(3);
 
     IF day_number = 0 THEN SET day_str = 'SUN';
     ELSEIF day_number = 1 THEN SET day_str = 'MON';
     ELSEIF day_number = 2 THEN SET day_str = 'TUE';
     ELSEIF day_number = 3 THEN SET day_str = 'WED';
     ELSEIF day_number = 4 THEN SET day_str = 'THU';
     ELSEIF day_number = 5 THEN SET day_str = 'FRI';
     ELSEIF day_number = 6 THEN SET day_str = 'SAT';
     END IF;

     RETURN day_str;

END $$
DELIMITER ;