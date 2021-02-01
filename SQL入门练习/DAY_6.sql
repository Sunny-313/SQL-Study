DAY 6
-- 数据过滤like 模糊查询
-- 通配符（_）; % 

-- _确切知道字符的个数
SELECT * FROM milk_tea;
SELECT * FROM milk_tea WHERE prod_name LIKE '奶_'; 
SELECT * FROM milk_tea WHERE prod_name LIKE '方_面';
SELECT * FROM milk_tea WHERE prod_name LIKE '__面';
-- _可以不确定字符的个数
SELECT * FROM milk_tea WHERE prod_name LIKE '%面';
SELECT * FROM milk_tea WHERE prod_name LIKE '%糖';
-- 转义字符\(要知道)


-- and or
SELECT * FROM milk_tea WHERE sale_price >= 5 ;
SELECT * FROM milk_tea WHERE sale_price <= 15 ;

-- 合并上面两条语句
SELECT * FROM milk_tea WHERE sale_price >= 5 AND sale_price <= 15 ;

-- 对于and 和or 的执行顺序问题可以使用括号


SELECT * FROM milk_tea WHERE prod_name = '奶茶' OR prod_name = '薯片' OR prod_name = '棒棒糖';
SELECT * FROM milk_tea WHERE prod_name IN ('奶茶','薯片','棒棒糖');
SELECT * FROM milk_tea WHERE sale_price IN ('10.8','2.1','9.3');


Q3：写出以下语句。
1、从 milk_tea 表中找到产品名是‘薯’开头或者‘糖’结尾的。
2、从 milk_tea 表中找到产品名是‘薯’开头或者‘糖’结尾的，且产品名称只有 2 个字。
3、从 milk_tea 表中找到产品名是‘奶’开头并且‘茶’结尾的。
4、从 milk_tea 表中找到销售价格不大于 10 的产品。（2 种写法）

SELECT * FROM milk_tea WHERE prod_name LIKE '薯%' OR prod_name LIKE '%糖';
SELECT * FROM milk_tea WHERE prod_name LIKE '薯_' OR prod_name LIKE '_糖';
SELECT * FROM milk_tea WHERE prod_name LIKE '奶%' AND prod_name LIKE '%茶';

SELECT * FROM milk_tea WHERE sale_price <= 10;
SELECT * FROM milk_tea WHERE NOT sale_price > 10;