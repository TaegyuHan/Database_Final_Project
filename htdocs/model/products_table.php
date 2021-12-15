<?php 
include_once("../db/db_connect.php");

# -------------------------------------- # 
# Products Model
# -------------------------------------- # 

class ModelProductsTable extends Database
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
        # order 데이터 호출 함수

        # 쿼리 실행
        $sql = "CALL get_list_products(".$idx.", ".$dataCount.");";
        $data = $this->con->query($sql);
        return $data;
    }

}

// $model = new ModelProductsTable();
// $model->getTableList(1, 32);

?>





