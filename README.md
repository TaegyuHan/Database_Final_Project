# 기말고사 과제

강의실: ML304 ( SCH 미디어랩스관 )
과목명: 데이터베이스 개론
교수 명: 우지영
시간: 2021/12/13
학점: 3_학점

순천향대학교 데이터베이스개론 ( 우지영 ) 기말과제 입니다.

---

# 과제 요구사항

> php로 다음의 기능이 가능한 웹사이트를 만드시오. 편리성을 높이도록 자유롭게 디자인하시오.
> 

### 데이터 링크

[https://www.kaggle.com/psparks/instacart-market-basket-analysis?select=order_products__prior.csv](https://www.kaggle.com/psparks/instacart-market-basket-analysis?select=order_products__prior.csv)

1. MYSQL 워크벤치에서 다음의 데이터를 저장하는 데이터베이스를 만들고 
( 필요시 제약조건은 자유롭게 설정 )
2. 각 파일을 조회하는 화면 ( order_product는 3번 문제로 나와있음 ), 홈 화면이 있고, 각각의 화면이 연동되어있어야 함
3. 새로운 매출이 발생할때 입력이 가능한 화면 ( order_product )
4. order번호를 넣으면 order_product 데이터를 수정할 수 있는 화면

## 과제 제출 방법

각 문제에 대한 화면을 캡쳐해서 워드 파일 문제 밑에 삽입하고, 각 소스코드는 워드와 합쳐서 zip으로 제출합니다.

---

# 사용 tools

- [MySQL](https://www.mysql.com/) > version : 8.0.27
- [PHP](https://www.php.net/) > version : 8.0.13
- [bootstrap](https://getbootstrap.com/) > version : **v5.1.3**
- [draw.io](http://draw.io) > version : 15.8.7
- [Visaul Studio Code](https://code.visualstudio.com/) > version : 1.63.0
- [Color Cop](https://code.visualstudio.com/) > version : v5.4.3

---

# 폴터 경로 설명

```java
├─dashboard
│ # 기존 bootstrap 코드
│ 
├─data
│  └─csv
│   # 교수님 drap 데이터 폴더
│   # 데이터 size 초과로 폴더만 존재 합니다.
│   # 다운로드는 다음 경로를 이용해 주세요
│   # URL : 위의 데이터 링크 참조
│
├─htdocs
│  ├─assets
│  │  # bootstrap 코드
│  │  
│  ├─control
│  │  # page 생성 코드 MVC(control) 부분
│  │  
│  ├─db
│  │  # DB 연결 코드 mysqli 부분
│  │  
│  ├─model MVC(model) 부분
│  │  # DB 접속 코드 데이터
│  │  # 데이터 불러오는 부분
│  │
│  └─view
│      │ # html code 부분 
│      │ # MVC(control) 에서 호출되어 사용.
│      └─include
├─img
│ # word 제출 이미지
│ 
├─R
│ # csv 데이터 확인용으로 사용
│ 
├─SQL
│  │ # SQL 프로시져 함수 생성 코드
│  ├─function
│  └─procedure
│ 
├─교수님_요구사항
│ 
└─설계
    # draw.io file > 구조도 확인 가능
    # 데이터 베이스 모델링 설계
    # 코드  설계
```