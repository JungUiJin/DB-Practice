-- 06. grouping

-- GROUP BY : 결과 집합을 특정 열의 값에 따라 그룹화
-- HAVING : group by절과 함께 ㅏㅅ용하며 그룹의 조건을 적용
USE menudb;
--- count 함수 : 행의 개수를세는 함수
SELECT
		 category_code
	  , COUNT(*)
  FROM tbl_menu
 GROUP BY category_code;

--- count함수 특징
SELECT
		 COUNT(*)
	  , COUNT(category_code)
	  , COUNT(ref_category_code)
  FROM tbl_category;
-- sum 함수 : 합계를 나타내는 함수
SELECT
		 category_code
	  , SUM(menu_price)
  FROM tbl_menu
 GROUP BY category_code;
-- avg 함수 사용 : 평균을 나타내는 함수
SELECT
		 category_code
	  , AVG(menu_price)
  FROM tbl_menu
 GROUP BY category_code;
-- MIN/MAX 함수 사용 : 최소/최대값을 나타내는 함수
SELECT
		 category_code
	  , MIN(menu_price) 싼거
	  , MAX(menu_price) 비싼거
  FROM tbl_menu
 GROUP BY category_code;
-- sum/avg는 숫자 데이터에 사용, max/min은 모든 데이터에 사용
USE employeedb;
SELECT 
		 MIN(emp_name)
	  , MAX(emp_name)
	  , MIN(hire_date)
	  , MAX(hire_date)
  FROM employee;
-- 두 개 이상의 그룹 생성
SELECT
		 menu_price
	  , category_code
	  , COUNT(*)
  FROM tbl_menu
 GROUP BY menu_price, category_code;
-- join이랑 사용
SELECT
		 a.category_code
	  , b.category_name
	  , AVG(a.menu_price)
 FROM tbl_menu a
 JOIN tbl_category b ON (a.category_code = b.category_code)
GROUP BY a.category_code, b.category_name;

-- having절 활용 : grouping 된 조건 필터링
SELECT
		 a.category_code
	  , b.category_name
	  , AVG(a.menu_price) 가격평균
  FROM tbl_menu a
  JOIN tbl_category b ON (a.category_code = b.category_code)
 GROUP BY a.category_code, b.category_name
HAVING 가격평균 <= 10000;

-- select : 조회 대상 컬럼
-- from : 조회 대상 테이블
-- join : 조회 대상 테이블
-- where : 테이블 행을 조건으로 필터링
-- group by : 대상 컬럼으로 결과 집합 그루핑
-- having : grouping 결과를 조건으로 필터링
-- order by : 정렬 기준

-- 집계함수 rollup : 컬럼 한개를 활용했을 경우
SELECT
	    menu_price
	  , category_code
	  , SUM(menu_price)
  FROM tbl_menu
GROUP BY menu_price, category_code
 WITH ROLLUP;
