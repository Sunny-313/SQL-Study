Q3：新建一个叫做 test_sjlx2 的表，
表内有两列分别为 id_date（数据类型 date），
 id_char（数据类型 varchar（255）），
 表内数据分别为 id_date 列是“当时的日期”，“当时日期的
后 1 天”，“当时日期的前 1 天”，“当时日期的后 1 个月”，id_char 列是“123”，“home”，
“家春秋”，“今天星期五”。 并用 CHAR_LENGTH 函数和 LENGTH 函数分别操作 id_char
列，得出结果，并分析异同。

SELECT CURRENT_DATE;
SELECT DATE_ADD(CURRENT_DATE,INTERVAL 1 DAY);
SELECT DATE_SUB(CURRENT_DATE,INTERVAL 1 DAY);
SELECT DATE_ADD(CURRENT_DATE,INTERVAL 1 MONTH);
SELECT id_data ,id_char,CHAR_LENGTH(id_data),LENGTH(id_char) FROM test_day7;