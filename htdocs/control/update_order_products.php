<?php 
include_once("../model/order_products_table.php");
include("../view/include.php");


# -------------------------------------- # 
# UpdateOrder 페이지 컨트롤 페이지
# -------------------------------------- # 


class ControlUpdateOrderProduct
{

    public function __construct()
    {
        # 생성자 함수
        $this->html_include = new HtmlInclude();
    }

    public function page()
    {
        # 페인 페이지 제작 함수

        # 화면 불러오기
        $this->html_include->htmlHead();
        include("../view/update_order_products.php");
        $this->html_include->htmlFooter();
        $this->html_include->otherPopUp();
    }

    public function insertDataPage()
    {
        # udpate 리스트 호출 페이지 함수

        # 페이지 넘버 확인
        if (isset($_GET['pageno'])) {
            $pageno = $_GET['pageno'];
        } else {
            $pageno = 1;
        }

        # 데이터 호출 클래스 > mdoel
        $model = new ModelOrderProductsTable();
        $updateorderProducts = $model->getUpdateTableList($_POST["order_id"], $pageno, 10);

        # 화면 불러오기
        $this->html_include->htmlHead();
        include("../view/update_list_order_products.php");
        $this->html_include->htmlFooter();
        $this->html_include->otherPopUp();
    }

}

# 페이지 생성
$page = new ControlUpdateOrderProduct();

# 생성 페이지 구분
if(!isset($_POST["order_id"])) {   
    # order_id 데이터 안받은 처음 화면
    $page->page();
}else if( $_POST["order_id"] != "")  {   
    # order_id 데이터를 받은 화면
    $page->insertDataPage();
} else {
    # order_id 빈 데이터를 받은 화면
    $page->page();
    echo '<script>alert("데이터를 전부 입력해주세요");</script>';
}

?>