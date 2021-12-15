<?php 
include_once("../model/products_table.php");
include("../view/include.php");


# -------------------------------------- # 
# Products 페이지 컨트롤 페이지
# -------------------------------------- # 


class ControlProductsTable
{
    public $html_include;

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

        # 데이터 홀출 클래스 > model
        $model = new ModelProductsTable();
        $productsArray = $model->getTableList($pageno, 10);

        # 화면 불러오기
        $this->html_include->htmlHead();
        include("../view/products_table.php");
        $this->html_include->htmlFooter();
        $this->html_include->otherPopUp();
    }   
}

# 페이지 생성
$page = new ControlProductsTable();
$page->page();

?>