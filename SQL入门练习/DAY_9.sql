SELECT * FROM `prod_info` AS p;
SELECT * FROM supplier_info AS s;


SELECT s.* , p.*
FROM
	supplier_info AS s , prod_info AS p ;
WHERE
	s.supplier_id = p.supplier_id;
	
	
-- 外部链接  这种情况只能查找单个表对应的列，不可显示多张表的列	
SELECT p.* FROM prod_info AS p; 
SELECT o.* FROM order_list AS o;
SELECT o.prod_id FROM order_list AS o WHERE o.order_id = '20190401001';

SELECT * 
FROM prod_info AS p 
WHERE p.prod_id IN (
									SELECT o.prod_id 
									FROM order_list AS o 
									WHERE o.order_id = '20190401001'
									);
									
SELECT * 
FROM prod_info AS p 
WHERE p.prod_id IN (
									'10001','10002'
									);
									
-- 使用内连接
SELECT p.*,o.*
FROM prod_info AS p , order_list AS o 
WHERE p.prod_id = o.prod_id
  AND o.order_id = '20190401001';
-- 这两种表达结果是相同的
SELECT p.*,o.*
FROM prod_info AS p INNER JOIN order_list AS o 
ON p.prod_id = o.prod_id
  AND o.order_id = '20190401001';
-- 左外连接 将左边的表行全部显示
SELECT c.*, o.*
FROM cust_info AS c LEFT OUTER JOIN order_list AS o
ON c.cust_id = o.cust_id
 AND o.order_id LIKE '20190404%';
 
-- --------------------------------------------------------------------
-- c2表示目标表（相当于新表）
SELECT c1.cust_id , COUNT(c1.prod_id)
FROM (SELECT c.cust_id,c.cust_name,O.prod_id,o.prodname,o.order_id
			FROM cust_info AS c LEFT OUTER JOIN order_list AS o
			ON c.cust_id = o.cust_id
		  AND o.order_id LIKE '20190401%') c1
GROUP BY c1.cust_id ;
-- 这两种表达方式的结果是一样的
SELECT c.cust_id ,COUNT(O.prod_id) 
FROM  cust_info AS c LEFT OUTER JOIN order_list AS o
			ON c.cust_id = o.cust_id
			AND o.order_id LIKE '20190404%'
GROUP BY c.cust_id ;
--  UNION 一般用的不是很多，了解
SELECT * FROM order_list WHERE order_id LIKE '20190407%'
UNION
SELECT * FROM order_list WHERE order_id LIKE '20190404%';

--  显示全部数据，不会自动去重
SELECT * FROM order_list WHERE order_id LIKE '20190407%'
UNION ALL
SELECT * FROM order_list WHERE order_id LIKE '20190407%';
 
-- Q3：按要求写出以下语句。
-- 1、找出所有洁云牌抽纸的销售流水（使用标量子查询）。
SELECT p.prod_id 
FROM prod_info AS p 
WHERE p.brand = '洁云'

SELECT o.*
FROM order_list AS o 
WHERE o.prod_id= (
									SELECT p.prod_id 
									FROM prod_info AS p 
									WHERE p.brand = '洁云'
);
-- 2、找出各类商品中，价格高于该类商品均价的部分（使用关联子查询）。
SELECT *
FROM prod_info AS p2
WHERE p2.sale_price > ( SELECT AVG(p1.sale_price)
												FROM prod_info AS p1
												WHERE p1.class = p2.class
												GROUP BY p2.class 
);

-- 3、用联结的方法改写第一题。找出所有洁云牌抽纸的销售流水
SELECT o.*
FROM order_list AS o INNER JOIN prod_info AS p 
ON p.prod_name='抽纸'AND p.brand = '洁云'
 AND o.prod_id = p.prod_id;
									 

-- 4、归总下所有商品的销量。

? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?  ? ?
-- SELECT p.prod_id
-- FROM prod_info AS p 
-- 
-- SELECT o.prod_id,o.prodname , SUM(o.quantity)
-- FROM order_list AS o 
-- WHERE o.prod_id = (SELECT p.prod_id
-- 									 FROM prod_info AS p 
-- 									 )
-- GROUP BY o.prod_id;
-- 多练多练！！！
SELECT p.prod_name,p.brand,SUM(o.quantity) quantity #起别名quantity
FROM prod_info AS p LEFT OUTER JOIN order_list AS o
ON p.prod_id = o.prod_id
GROUP BY p.prod_name,p.brand;
	
