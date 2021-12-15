<?php 
include_once("../db/db_connect.php");


# -------------------------------------- # 
# OrderProducts Model 데이터 베이스 연결 부분
# -------------------------------------- # 


class ModelOrderProductsTable extends Database
{
    public $result;
    public $con;

    public function __construct()
    {
        # 데이터 베이스 연결 생성자
        parent::__construct();
        $this->con = $this->connect();
    }

    public function getTableList($idx, $dataCount)
    {
        # order products 데이터 호출 함수

        # 쿼리 실행
        $sql = "CALL get_list_order_products(".$idx.", ".$dataCount.");";
        $data = $this->con->query($sql);
        return $data;
    }

    public function insertTableData(
        $in_order_id,
        $in_product_id,
        $in_add_to_cart_order,
        $in_reordered
    )
    {
        # order products 데이터 삽입 함수

        # 쿼리 실행
        $sql = "CALL insert_order_products(".$in_order_id.", ".$in_product_id.", ".$in_add_to_cart_order.", ".$in_reordered.");";
        $data = $this->con->query($sql);
        return;
    }

    public function getUpdateTableList($in_order_id, $idx, $show_row_count)
    {
        # order products 데이터 업데이트 리스트 호출 함수

        # 쿼리 실행
        $sql = "CALL get_update_list_order_products(".$in_order_id.", ".$idx.", ".$show_row_count.");";
        $data = $this->con->query($sql);
        return $data;
    }

    public function UpdateTableData(
        $in_order_id, 
        $in_product_id, 
        $in_add_to_cart_order, 
        $in_reordered, 
        $in_order_product_id
    )
    {
        # order products 데이터 업데이트  함수

        # 쿼리 실행
        $sql = "CALL update_order_products(".$in_order_id.", ".$in_product_id.", ".$in_add_to_cart_order.", ".$in_reordered.", ".$in_order_product_id.");";
        $data = $this->con->query($sql);
        return $data;
    }
}

// $model = new ModelOrderProductsTable();
// $model->getTableList(1, 32);

?>



