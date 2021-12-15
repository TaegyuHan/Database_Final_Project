<?php 
include_once("../model/departments_table.php");
include("../view/include.php");


# -------------------------------------- # 
# Departments 페이지 컨트롤 페이지
# -------------------------------------- # 


class ControlDepartmentsTable
{
    public $html_include;

    public function __construct()
    {
        # 생성자 함수
        $this->html_include = new HtmlInclude();
    }

    public function page()
    {
        # 메인 페이지 제작 함수
        
        # 페이지 넘버 확인
        if (isset($_GET['pageno'])) {
            $pageno = $_GET['pageno'];
        } else {
            $pageno = 1;
        }


        # 데이터 호출 클래스 > model
        $model = new ModelDepartmentsTable();
        $departmentsArray = $model->getTableList($pageno, 10);

        # 화면 불러오기
        $this->html_include->htmlHead();
        include("../view/departments_table.php");
        $this->html_include->htmlFooter();
        $this->html_include->otherPopUp();
    }
}

# 페이지 생성
$page = new ControlDepartmentsTable();
$page->page();

?>