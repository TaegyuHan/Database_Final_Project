
<?php


# -------------------------------------- # 
# html 페이지 분할 클래스
# -------------------------------------- # 


class HtmlInclude
{
    public function htmlHead()
    {
        # head
        include('../view/include/head.html');
    }

    public function otherPopUp()
    {
        # 팝업 창
        include('../view/include/other_popup.html');
    }

    public function htmlFooter()
    {
        # footer
        include('../view/include/footer.html');
    }

}


# -------------------------------------- # 
# 페이지 번호 생성 함수
# -------------------------------------- # 


function pageNaviPageNumber($pageno)
{
    return ceil($pageno / 10);
}

function pageNaviBackPageNumber($pageno)
{
    return ceil(($pageno - 10) / 10);
}

function pageNaviFrontPageNumber($pageno)
{
    return ceil(($pageno + 10) / 10);
}

function pageNaviBackRowNumber($pageno)
{
    return $pageno - 10;
}

function pageNaviFrontRowNumber($pageno)
{
    return $pageno + 10;
}


?>