# ------------------------------------------------------- #
# csv file 확인하는 코드 
# time : "2021-12-13 16:45:27 KST"
# ------------------------------------------------------- #

# ------------------------ #
# library
# ------------------------ #
if (!require("stringr")) {install.packages("stringr"); library("stringr")}
if (!require("tidyverse")) {install.packages("tidyverse"); library("tidyverse")}


# ------------------------ #
# function
# ------------------------ #

check.empty.data <- function(df) {
  # null, NA 확인 함수
  
  colname.list <- df %>% colnames()
  
  for (col in colname.list) {
    col.na <- aisles.csv["aisle_id"] %>% is.na() %>% sum()
    col.null <- aisles.csv["aisle_id"] %>% is.null() %>% sum()
    
    cat("colname :", col, "/t")
    cat("col.na  :" ,col.na, "/t")
    cat("col.null  :" ,col.null,  "/n")
  }  
  
}


# ------------------------ #
# read data
# ------------------------ #
setwd("C:/Users/gksxo/Desktop/Folder/순천향대학교/2021_2학기_3학년1학기/데이터베이스개론/기말과제/data/archive")




# ------------------------------------------------ #
# aisles.csv
# ------------------------------------------------ #
aisles.csv <- read.csv("aisles.csv")

str(aisles.csv)
# 'data.frame':	134 obs. of  2 variables:
# $ aisle_id: int  1 2 3 4 5 6 7 8 9 10 ...
# $ aisle   : chr  "prepared soups salads" "specialty cheeses" "energy granola bars" "instant foods" ...

check.empty.data(aisles.csv)
# colname : aisle_id 	col.na  : 0 	col.null  : 0 
# colname : aisle 	col.na  : 0 	col.null  : 0 

max(nchar(aisles.csv$aisle))
# [1] 29

# MySQL
# table name : aisles
# --------------------
# aisle_id : INT
# aisle : VARCHAR(29 + 3 = 32)




# ------------------------------------------------ #
# departments.csv
# ------------------------------------------------ #
departments.csv <- read.csv("departments.csv")

check.empty.data(departments.csv)
# colname : department_id 	col.na  : 0 	col.null  : 0 
# colname : department 	col.na  : 0 	col.null  : 0 

str(departments.csv)

# 'data.frame':	21 obs. of  2 variables:
# $ department_id: int  1 2 3 4 5 6 7 8 9 10 ...
# $ department   : chr  "frozen" "other" "bakery" "produce" ...

max(nchar(departments.csv$department))
# [1] 15

# MySQL
# table name : departments
# --------------------
# department_id : INT
# department : VARCHAR(15 + 3 = 18)




# ------------------------------------------------ #
# order_products__prior.csv
# ------------------------------------------------ #
order_products__prior.csv <- read.csv("order_products__prior.csv")

check.empty.data(order_products__prior.csv)
# colname : order_id 	col.na  : 0 	col.null  : 0 
# colname : product_id 	col.na  : 0 	col.null  : 0 
# colname : add_to_cart_order 	col.na  : 0 	col.null  : 0 
# colname : reordered 	col.na  : 0 	col.null  : 0 

str(order_products__prior.csv)
# 'data.frame':	32434489 obs. of  4 variables:
# $ order_id         : int  2 2 2 2 2 2 2 2 2 3 ...
# $ product_id       : int  33120 28985 9327 45918 30035 17794 40141 1819 43668 33754 ...
# $ add_to_cart_order: int  1 2 3 4 5 6 7 8 9 1 ...
# $ reordered        : int  1 1 0 1 0 1 1 1 0 1 ...


# order_products__prior.csv 파일
# PK 찾는 코드
csv.nrow <- nrow(order_products__prior.csv)
for (colname in colnames(order_products__prior.csv)) {
  
  colname.unique.value.nrow <- order_products__prior.csv["order_id"] %>% 
    unique() %>% 
    nrow()
  
  if (csv.nrow == colname.unique.value.nrow) {
    cat(colname, "/n")
    cat(csv.nrow, " == ", colname.unique.value.nrow)
  }
}


# MySQL
# table name : order_products
# --------------------
# order_id : INT
# product_id : INT
# add_to_cart_order : INT
# reordered : INT


# ------------------------------------------------ #
# orders.csv
# ------------------------------------------------ #
orders.csv <- read.csv("orders.csv")

max(orders.csv$order_id)

check.empty.data(orders.csv)
# colname : order_id 	col.na  : 0 	col.null  : 0 
# colname : user_id 	col.na  : 0 	col.null  : 0 
# colname : eval_set 	col.na  : 0 	col.null  : 0 
# colname : order_number 	col.na  : 0 	col.null  : 0 
# colname : order_dow 	col.na  : 0 	col.null  : 0 
# colname : order_hour_of_day 	col.na  : 0 	col.null  : 0 
# colname : days_since_prior_order 	col.na  : 0 	col.null  : 0 


str(orders.csv)
# 'data.frame':	3421083 obs. of  7 variables:
# $ order_id              : int  2539329 2398795 473747 2254736 431534 3367565 550135 3108588 2295261 2550362 ...
# $ user_id               : int  1 1 1 1 1 1 1 1 1 1 ...
# $ eval_set              : chr  "prior" "prior" "prior" "prior" ...
# $ order_number          : int  1 2 3 4 5 6 7 8 9 10 ...
# $ order_dow             : int  2 3 3 4 4 2 1 1 1 4 ...
# $ order_hour_of_day     : int  8 7 12 7 15 7 9 14 16 8 ...
# $ days_since_prior_order: num  NA 15 21 29 28 19 20 14 0 30 ...


# 새로운 테이블 생성 FK로 변경
orders.csv$eval_set[orders.csv$eval_set == "prior"] <- 1
orders.csv$eval_set[orders.csv$eval_set == "train"] <- 2
orders.csv$eval_set[orders.csv$eval_set == "test"] <- 3

# 변경한 csv 저장
SAVE_PATH <- "C:/Users/gksxo/Desktop/Folder/github/Database_Final_Project/data/csv/"
write.csv(orders.csv, file=paste0(SAVE_PATH, "new_orders.csv"))

unique(orders.csv$eval_set)
# [1] "prior" "train" "test"
# 새로운 테이블 > eval_set_TB

# MySQL
# table name : orders
# --------------------
# order_id : INT
# user_id : INT
# eval_set : INT
# order_number : INT
# order_dow : INT
# order_hour_of_day : INT
# days_since_prior_order : INT


# ------------------------------------------------ #
# product.csv
# ------------------------------------------------ #
product.csv <- read.csv("products.csv")

check.empty.data(product.csv)
# colname : product_id 	col.na  : 0 	col.null  : 0 
# colname : product_name 	col.na  : 0 	col.null  : 0 
# colname : aisle_id 	col.na  : 0 	col.null  : 0 
# colname : department_id 	col.na  : 0 	col.null  : 0 

str(product.csv)
# 'data.frame':	49688 obs. of  4 variables:
# $ product_id   : int  1 2 3 4 5 6 7 8 9 10 ...
# $ product_name : chr  "Chocolate Sandwich Cookies" "All-Seasons Salt" "Robust Golden Unsweetened Oolong Tea" "Smart Ones Classic Favorites Mini Rigatoni With Vodka Cream Sauce" ...
# $ aisle_id     : int  61 104 94 38 5 11 98 116 120 115 ...
# $ department_id: int  19 13 7 1 13 11 7 1 16 7 ...

max(stringr::str_length(product.csv$product_name))
# [1] 159

# MySQL
# table name : products
# --------------------
# product_id : INT
# product_name : TEXT 
# aisle_id : INT
# department_id : INT

