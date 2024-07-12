-- 02. ORDER BY

-- 가격으로 정렬 
SELECT
		  menu_code
		, menu_name
		, menu_price
  FROM  tb1_menu
 ORDER BY menu_price DESC; -- 내림차순(DESC), 기본은 오름차순(ASC)  

--정렬 기준이 2개 이상인 경우
SELECT
		  menu_code
		, menu_name
		, menu_price
  FROM  tbl_menu
 ORDER BY menu_price DESC, menu_name ASC;

-- 연산 결과 활용
SELECT
		  menu_code
		, menu_name
		, menu_price
		, menu_code * menu_price AS '연산결과' -- 별칭 지정, as없어도 괜찮긴 함.
  FROM  tbl_menu
 ORDER BY menu_price * menu_code;
 
-- field(?, ?, ?, ? ...) 첫번째 인자값이 그 다음 인자값 중 위치하는 인덱스를 반환.
SELECT FIELD('A', 'A', 'B', 'C');
SELECT FIELD('B', 'A', 'B', 'C');
SELECT FIELD('C', 'A', 'B', 'C');

SELECT
		  menu_name
		, orderable_status
 		, FIELD(orderable_status, 'N', 'Y')
  FROM  tbl_menu
  ORDER BY FIELD(orderable_status, 'N', 'Y');
  
-- null데이터의 정렬 순서
SELECT
	    category_code
	  , category_name
	  , ref_category_code
  FROM tbl_category
 ORDER BY -ref_category_code DESC;