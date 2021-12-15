<?php 
include_once("../model/order_products_table.php");
include("../view/include.php");


# -------------------------------------- # 
# insert odrder products 페이지 컨트롤 페이지
# -------------------------------------- # 


class ControlInsertOrderProduct
{

    public function __construct()
    {
        # 생성자 함수
        $this->html_include = new HtmlInclude();
    }

    public function page()
    {
        # 메인 페이지 제작 함수

        # 화면 불러오기
        $this->html_include->htmlHead();
        include("../view/insert_order_products.php");
        $this->html_include->htmlFooter();
        $this->html_include->otherPopUp();
    }

    public function insertDatSuccessaPage()
    {
        # 데이터 삽입 화면 페이지 제작 함수

        # 데이터 호출 클래스 > model
        $model = new ModelOrderProductsTable();
        $model->insertTableData(
            $_POST["aisle_id"],
            $_POST["product_id"],
            $_POST["add_to_cart_order"],
            $_POST["reordered"]
        );
        
        # 화면 불러오기
        $this->html_include->htmlHead();
        include("../view/success_insert_order_products.php");
        $this->html_include->htmlFooter();
        $this->html_include->otherPopUp();
    }
}

# 페이지 생성
$page = new ControlInsertOrderProduct();


# 생성 페이지 구분
if(!isset($_POST["aisle_id"])) 
{
    # 메인 페이지 생성
    $page->page();

# 데이터 생성 페이지 구분
} else if( $_POST["aisle_id"] != "" &&
           $_POST["product_id"] != "" &&
           $_POST["add_to_cart_order"] != "" &&
           $_POST["reordered"] != "" ) 
{
    # 데이터 삽입 성공 페이지
    $page->insertDatSuccessaPage();
} else {
    
    # 메인 페이지 생성
    $page->page();
    echo '<script>alert("데이터를 전부 입력해주세요");</script>';
}

?>