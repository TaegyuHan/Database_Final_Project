<?php 


# -------------------------------------- # 
// 데이터 베이스 연결
# -------------------------------------- # 


Class Database
{
    private $user ;
    private $host;
    private $pass;
    private $db;

    public function __construct()
    {
        $this->user = 'localhost';
        $this->host = '<아이디>';
        $this->pass = '<비밀번호>';
        $this->db = 'finaldb';
    }

    public function connect()
    {
        # 연결 부분
        $mysqli = new mysqli(
            $this->user,
            $this->host,
            $this->pass,
            $this->db
        );

        if(mysqli_connect_errno()){
            echo mysqli_connect_error();
        }

        return $mysqli;
    }
}

?>