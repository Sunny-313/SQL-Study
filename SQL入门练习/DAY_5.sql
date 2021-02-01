-- 过滤子句where，不能单独使用。非必需子句
-- FROM之后，ORDER之前/文本格式（需要做编码格式的处理），大小比较/NULL值的处理
-- 对行进行操作
SELECT m.* FROM milk_tea AS m;
SELECT m.* FROM milk_tea AS m WHERE m.prod_name ='奶糖';
SELECT m.* FROM milk_tea AS m WHERE m.net_w ='150g';
SELECT m.* FROM milk_tea AS m WHERE m.prod_id =2;
SELECT m.* FROM milk_tea AS m WHERE m.prod_id ='2';

SELECT m.* FROM milk_tea AS m WHERE m.in_price < 10;
IFNULL(sale_price,0)
SELECT m.* FROM milk_tea AS m WHERE m.sale_price <> 15;
SELECT m.* FROM milk_tea AS m WHERE IFNULL(sale_price,0) <> 15;

SELECT m.* FROM milk_tea AS m WHERE m.in_price <= 10;
SELECT m.* FROM milk_tea AS m WHERE m.in_price BETWEEN 12 AND 15;
SELECT m.* FROM milk_tea AS m WHERE m.sale_price IS NOT NULL;

-- 1.请注意，应避免在WHERE子句中使用IFNULL函数，因为它会降低查询的性能。
-- 2.如果要检查值是否为NULL，则可以在WHERE子句中使用IS NULL或IS NOT NULL
SELECT m.* FROM milk_tea AS m WHERE m.sale_price IS NULL;
SELECT m.* FROM milk_tea AS m WHERE IFNULL(m.sale_price,11)=11;

Q3：分别写出以下语句。
1、选出 milk_tea 表的所有列。
2、选出 milk_tea 表的所有列，要求 sale_price 不为空。
3、选出 milk_tea 表的所有列，并按 sale_price 列排序，sale_price 为空的话，按 10 处
理。
4、选出 milk_tea 表的所有列，要求 sale_price 上浮 10%后大于 16。sale_price 为空的
话，默认设置为 20。
5、选出 milk_tea 表的产品列，要求利润（sale_price – in_price）大于 5。如果 sale_price
为空的话，默认设置为 20。
6、对 5 的结果按照 sale_price 倒序排列。

SELECT m.* FROM milk_tea AS m;
SELECT m.* FROM milk_tea AS m WHERE m.sale_price IS NOT NULL;
SELECT m.* FROM milk_tea AS m ORDER BY IFNULL(sale_price,10);
SELECT m.* FROM milk_tea AS m WHERE IFNULL(m.sale_price,20)*1.1 > 16;
SELECT prod_name FROM milk_tea WHERE IFNULL( sale_price, 20 )- in_price > 5 ORDER BY sale_price DESC;

