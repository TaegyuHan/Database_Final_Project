<?php 
include_once("../model/order_products_table.php");
include("../view/include.php");


# -------------------------------------- # 
# UpdateOrder data 페이지 컨트롤 페이지
# -------------------------------------- # 


class ControlUpdateOrderDataProduct
{

    public function __construct()
    {
        # 생성자 함수
        $this->html_include = new HtmlInclude();
    }

    public function page()
    {
        # 메인 페이지 생성 함수    
    
        # 화면 불러오기
        $this->html_include->htmlHead();
        include("../view/update_order_products.php");
        $this->html_include->htmlFooter();
        $this->html_include->otherPopUp();
    }

    public function UpdatetDataPage()
    {
        # update 데이터 전송 후 화면 생성 함수

        # 페이지 번호 확인
        if (isset($_GET['pageno'])) {
            $pageno = $_GET['pageno'];
        } else {
            $pageno = 1;
        }

        # 데이터 호출 클래스 > mdoel
        $model = new ModelOrderProductsTable();

        # 데이터 삽입
        $model->UpdateTableData(
            $_POST["order_id"],
            $_POST["product_id"],
            $_POST["add_to_cart_order"],
            $_POST["reordered"],
            $_POST["order_product_id"]
        );

        # 데이터 삽입후 리스트 호출
        $updateorderProducts = $model->getUpdateTableList($_POST["order_id"], $pageno, 10);

        # 화면 불러오기
        $this->html_include->htmlHead();
        include("../view/update_list_order_products.php");
        $this->html_include->htmlFooter();
        $this->html_include->otherPopUp();
    }
}

# 페이지 생성
$page = new ControlUpdateOrderDataProduct();

# 생성 페이지 구분
if (
    $_POST["order_product_id"] != "" &&
    $_POST["order_id"] != "" &&
    $_POST["product_id"] != "" &&
    $_POST["add_to_cart_order"] != "" &&
    $_POST["reordered"] != ""
){
    # 데이터 존재 > 데이터 update 페이지
    $page->UpdatetDataPage();
} else {
    # order_id 빈 데이터를 받은 화면
    $page->page();
    echo '<script>alert("데이터를 전부 입력해주세요");</script>';
}

?>