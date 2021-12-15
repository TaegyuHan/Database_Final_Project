<?php 
include_once("../model/order_products_table.php");
include("../view/include.php");


# -------------------------------------- # 
# OrderProduct 페이지 컨트롤 페이지
# -------------------------------------- # 


class ControlOrderProductsTable
{

    public function __construct()
    {
        # 생성자 함수
        $this->html_include = new HtmlInclude();
    }

    public function page()
    {
        # 메인 페이지 생성 함수

        # 페이지 넘버 확인
        if (isset($_GET['pageno'])) {
            $pageno = $_GET['pageno'];
        } else {
            $pageno = 1;
        }
        
        # 데이터 호출 클래스 > model
        $model = new ModelOrderProductsTable();
        $orderProducts = $model->getTableList($pageno, 10);

        # 화면 불러오기
        $this->html_include->htmlHead();
        include("../view/order_products_table.php");
        $this->html_include->htmlFooter();
        $this->html_include->otherPopUp();
    }
}

# 페이지 생성
$page = new ControlOrderProductsTable();
$page->page();

?>