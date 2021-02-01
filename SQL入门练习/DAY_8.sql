-- 聚合函数 COUNT SUM AVG MAX MIN 
SELECT COUNT(*) FROM milk_tea;#其他聚合函数不可以这样用

SELECT COUNT(1) FROM milk_tea;

SELECT COUNT(prod_name) FROM milk_tea;  #结果是8
SELECT COUNT(sale_price) FROM milk_tea;#结果是7，因为其中包括空值null
-- 不建议同时使用多个count，容易出现这问题，这里仅作为练习使用！
SELECT COUNT(DISTINCT prod_name) ,COUNT(DISTINCT sale_price)FROM milk_tea;  
-- SUM要区别于普通的四则运算，会自动去除空值的
SELECT SUM(sale_price - in_price) FROM milk_tea ;#这里算出结果为31.5
-- 正解为
SELECT SUM(IFNULL(sale_price,0) - in_price) FROM milk_tea ;#结果为16

SELECT SUM(in_price * 1.1) FROM milk_tea ;
SELECT SUM(in_price * 1.1) FROM milk_tea ;

-- 平均值
SELECT AVG(sale_price) FROM milk_tea;
SELECT AVG(sale_price) /COUNT(sale_price) FROM milk_tea;
SELECT SUM(sale_price) /COUNT(1) FROM milk_tea;

select * FROM milk_tea;
SELECT m.net_w,SUM(m.sale_price) FROM milk_tea AS m WHERE m.net_w IN('100g','150g') GROUP BY m.net_w;
SELECT m.net_w,SUM(m.sale_price) FROM milk_tea AS m GROUP BY m.net_w HAVING m.net_w IN ('100g','150g');#不推荐，时间消耗长

--  WHERE 是对行进行过滤，HAVING对聚合的结果进行筛选。
SELECT * FROM  prod_info;
SELECT prod_name,COUNT(2) FROM prod_info GROUP BY prod_name ;
SELECT prod_name ,AVG(sale_price) FROM prod_info WHERE sale_price > 10 GROUP BY prod_name;
-- 对行进行过滤
SELECT prod_name ,COUNT(1) FROM prod_info WHERE sale_price > 10 GROUP BY prod_name;
SELECT class ,COUNT(2) FROM prod_info WHERE sale_price > 10 GROUP BY class;

SELECT  * FROM  prod_info;
-- Q1：使用聚合函数完成如下操作。
-- 1、产品信息表中一共有多少产品？
1  SELECT COUNT(*) FROM prod_info;
2  SELECT COUNT(1) FROM prod_info;
3  SELECT COUNT(prod_id) FROM prod_info;

-- 2、有哪些产品类别，每个类别分别又有多少种产品？
SELECT DISTINCT class FROM prod_info;
SELECT class , COUNT(class) FROM prod_info GROUP BY class;#这里的 COUNT(class) 可以是COUNT(1) ......

-- 3、一共有多少客户购买了商品？
-- SELECT * FROM cust_info;
-- SELECT  COUNT(DISTINCT cust_id) FROM cust_info;
SELECT * FROM order_list;
SELECT COUNT(DISTINCT cust_id) FROM order_list;

-- 4、哪些客户购买了商品，分别购买了多少？
SELECT cust_name , SUM(IFNULL(quantity,0)) FROM order_list GROUP BY cust_name;#若出现空值，则这是错误的
SELECT cust_name , SUM(IFNULL(quantity,0)) FROM order_list GROUP BY cust_name;

SELECT DISTINCT cust_id , cust_name FROM order_list;
SELECT DISTINCT cust_name FROM order_list;
#要注意不同用户可能出现同名的情况，因此查找的时候需要按照顾客id进行查找，所以上面前两行的查找错误的，不可按照顾客姓名查找
-- 正解
SELECT cust_id ,SUM(IFNULL(quantity,0)) FROM order_list GROUP BY cust_id;

Q2：使用 WHERE 和 HAVING 对数据记录进行正确过滤。
1、各类别中，产品销售价在 10 块以上的分别有多少？
# 这里count() 括号与count间不可产生空格
SELECT class , COUNT(*) AS '数量' FROM  prod_info WHERE sale_price > 10 GROUP BY class;

2、各类别中，产品数量在 5 件以上的分别有哪些？
SELECT class ,COUNT(1) FROM prod_info GROUP BY class HAVING COUNT(1) > 5;

3、购买商品超过 5 件的用户有哪些？
SELECT * FROM order_list ;
SELECT cust_id ,SUM(IFNULL(quantity,0)) FROM order_list GROUP BY cust_id HAVING SUM(IFNULL(quantity,0)) > 5;

-- HAVING操作对象是聚合函数必须放在GROUP BY 之后，不可有缺少
-- GROUP BY 操作对象是聚合键，也是列名。
-- SELECT ... FROM ...WHERE ... GROUP BY ... HAVING ... ORDER BY...