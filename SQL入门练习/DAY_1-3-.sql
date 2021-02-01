-- 显示当前所有的数据库
SHOW DATABASES;


-- 使用数据库
-- USE STATISTIC;
-- 显示当前库中的表table
SHOW TABLES;

-- 显示当前mysql的版本
SELECT
	VERSION();
	
	
/*1.不区分大小写,但建议关键字大写，表名、列名小写
	2.每条命令最好用分号结尾
	3.每条命令根据需要，可以进行缩进 或换行
	4.注释
		单行注释：#注释文字
		单行注释：-- 注释文字
		多行注释：/* 注释文字  */
*/ 

SELECT
	prod_id 
FROM
	milk_tea;

SELECT
	prod_name 
FROM
	milk_tea;

SELECT
	net_w,
	pro_date 
FROM
	milk_tea;
	
SELECT * FROM milk_tea;

SELECT '王瑶瑶'AS user FROM milk_tea;
SELECT * FROM milk_tea;

SELECT prod_id, prod_name, net_w, pro_date, valid_month, in_price, sale_price , 0.9 AS sale_discount
FROM milk_tea;

SELECT mt.* 
FROM milk_tea AS mt;

SELECT mt.prod_id
FROM milk_tea AS mt;


-- SELECT prod_id, prod_name, net_w, pro_date, valid_month, in_price, sale_price , 0.9 AS sale_discount, 0.9*sale_price AS make_money
-- FROM milk_tea;

/*第三次作业
从表 milk_tea 中查询出商品名称（prod_name）、采购价（in_price）、销售价
（sale_price）三个字段，同时增加以下几列并为其命名：
“9 折”（discount1），9 折后的销售价（new_sale1），9 折后的销售利润（new_profit1），
“110%”（discount2），上浮 10%后的销售价（new_sale2），上浮 10%后的销售利润
（new_profit2）。*/

-- 这里注意0.9*sale_price-sale_price AS new_profit1    
-- 和1.1*sale_price-sale_price AS new_profit2这里的0.9*sale_price-sale_price 不可以写成
SELECT prod_name, in_price, sale_price, 
0.9 AS discount1, 0.9*sale_price AS new_sale1, 0.9*sale_price-sale_price AS new_profit1,
1.1 AS discount2, 1.1*sale_price AS neW_sale2, 1.1*sale_price-sale_price AS new_profit2
FROM milk_tea;


