
-- # -------------------------------- #
-- order_products update 프로시져
-- # -------------------------------- #

DROP PROCEDURE IF EXISTS update_order_products;
DELIMITER $$
CREATE PROCEDURE update_order_products(
    `in_order_id` INT,
    `in_product_id` INT,
    `in_add_to_cart_order` INT,
    `in_reordered` INT,
    `in_order_product_id` INT
)
BEGIN

    UPDATE order_products
    SET order_id = `in_order_id`,
        product_id = `in_product_id`,
        add_to_cart_order = `in_add_to_cart_order`,
        reordered = `in_reordered`
    WHERE order_product_id = `in_order_product_id`;

END $$
DELIMITER ;

CALL update_order_products(2, 28985, 3, 3, 31481718);