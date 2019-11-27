#条件查询
/*
语法：
SELECT
	查询列表
FROM	
	表名
WHERE
	筛选条件;

分类：
一、按条件表达式筛选
条件运算符：> < = <> >= <=
二、按逻辑表达式筛选
逻辑运算符：and or not 
三、模糊查询
like
between and
in
is null|is not null

*/ 

#一、按条件表达式筛选
#案例1：查询工资>12000的员工信息
SELECT
	* 
FROM
	employees 
WHERE
	salary > 12000;
	
#案例2：查询部门编号不等于90号的员工名和部门编号
SELECT
	last_name,
	department_id 
FROM
	employees 
WHERE
	department_id <> 90;

#二、按逻辑表达式筛选
#案例1：查询工资在10000到20000之间的员工名，工资以及奖金
SELECT
	last_name,
	salary,
	commission_pct 
FROM
	employees 
WHERE
	salary > 10000 
	AND salary < 20000;
#案例2：查询部门编号不是在90到110之间，或者工资高于15000的员工信息
SELECT * FROM employees WHERE department_id < 90 OR department_id > 110 OR salary > 15000;

#三、模糊查询
/*
like 
between and 
in
is null|is not null
*/

#like
#案例1：查询员工名中包含字符a的员工信息
SELECT
	* 
FROM
	employees 
WHERE
	last_name LIKE '%a%';
#案例2：查询员工名中第三个字符为n，第五个字符为l的员工名和工资
SELECT
	last_name,
	salary 
FROM
	employees 
WHERE
	last_name LIKE '__n_l%';
#案例3：查询员工名中第二个字符为_的员工名
SELECT
	last_name 
FROM
	employees 
WHERE
	last_name LIKE '_\_%';

#between and
#案例1：查询员工编号在100到120之间的员工信息
SELECT
	* 
FROM
	employees 
WHERE
	employee_id BETWEEN 100 
	AND 120;

#in
/*
含义：判断某字段的值是否属于in列表中的某一项
特点：提高语句简洁度；
			in列表的值类型必须一致或兼容
			不支持通配符
*/
#案例1：查询员工的工种编号是IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号
SELECT
	last_name,
	job_id 
FROM
	employees 
WHERE
	job_id IN ( 'IT_PROG', 'AD_VP', 'AD_PRES' );

#is null|is not null
#案例1：查询没有奖金的员工名和奖金率
SELECT
	last_name,
	commission_pct 
FROM
	employees 
WHERE
	commission_pct IS NULL;
#案例2：查询有奖金的员工名和奖金率
SELECT
	last_name,
	commission_pct 
FROM
	employees 
WHERE
	commission_pct IS NOT NULL;

#补充
#安全等于<=>
#案例1：查询没有奖金的员工名和奖金率
SELECT
	last_name,
	commission_pct 
FROM
	employees 
WHERE
	commission_pct <=> NULL;
#案例2：查询工资为12000的员工信息
SELECT
	* 
FROM
	employees 
WHERE
	salary <=> 12000;

