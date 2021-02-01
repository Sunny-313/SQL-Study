/*Q1：对 supplier_info 表中的信息进行拼接，分别达到如下效果。
1、查询所有供应商信息，展示结果要求为“xxx 供货商的地址为 xxxxxxx，联系电话为
xxxxxx。”，举例：“南京第一家供货商的地址为南京市光明大道 001 号，联系电话为
1338888001。”，并将该列命名为“供应商信息”。
2、查询所有供应商信息，展示结果要求为“xxx 供货商 | （地址） |（电话）。”，举
例：“南京第一家供货商 | 南京市光明大道 001 号 | 1338888001”，并将该列命名为“供
应商信息”。（2 种方法）*/

-- Q 1
SELECT s.* FROM supplier_info AS s;
SELECT s.*,CONCAT(s.supplier_name,'供货商的地址为',addr,'，联系电话为',tel) AS 供应商信息 FROM supplier_info AS s;
-- Q 2
SELECT s.*,CONCAT_WS('|',s.supplier_name,addr,tel) AS 供应商信息 FROM supplier_info AS s;

/*Q2：按要求进行排序操作。
1、对产品信息表中的产品采购价按升序排列
2、对产品信息表中的产品销售价按降序排列
3、对产品信息表中的产品销售价按升序排列，同时对采购价按降序排列
*/
SELECT p.* FROM prod_info AS p;
SELECT p.* FROM prod_info AS p ORDER BY cost;
SELECT p.* FROM prod_info AS p ORDER BY sale_price DESC;
SELECT p.* FROM prod_info AS p ORDER BY sale_price ,cost DESC;


/*Q3：按要求进行查询去重操作。
1、查询出所有有销售记录的产品。
2、查询出所有购买商品的顾客姓名*/
SELECT o.* FROM order_list AS o ;
SELECT DISTINCT prodname FROM order_list  ;
SELECT DISTINCT cust_name FROM order_list  ;
